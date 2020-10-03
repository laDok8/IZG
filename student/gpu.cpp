/*!
 * @file
 * @brief This file contains implementation of gpu
 *
 * @author Tomáš Milet, imilet@fit.vutbr.cz
 */

#include <student/gpu.hpp>
#include <vector>
#include <memory>
#include <cstring>
#include <iostream>

GPU::GPU(){
	bufferP = std::vector<std::unique_ptr<uint8_t[]>>(0);
	vertexSettings = std::vector<vertexTable *>(0);
	program = std::vector<std::unique_ptr<prg>>(0);
	activePuller = emptyID;
	activeProgram = emptyID;

}

GPU::~GPU(){
}

BufferID GPU::createBuffer(uint64_t size) {
	auto array = std::make_unique<uint8_t[]>(size);
	auto id = reinterpret_cast<BufferID>(array.get());
	bufferP.push_back(std::move(array));
	return id;
}

void GPU::deleteBuffer(BufferID buffer) {
	for(auto& ibuffer : bufferP){
		if(ibuffer.get() == reinterpret_cast<uint8_t*>(buffer))
			ibuffer.release();
	}
}

void GPU::setBufferData(BufferID buffer, uint64_t offset, uint64_t size, void const* data) {
	auto i = reinterpret_cast<uint8_t*>(buffer)+offset;
	std::memcpy(i,data,size);
}

void GPU::getBufferData(BufferID buffer, uint64_t offset, uint64_t size, void* data){
	auto i = reinterpret_cast<uint8_t*>(buffer)+offset;
	std::memcpy(data,i,size);
}

bool GPU::isBuffer(BufferID buffer) {
	if(buffer == 0)
		return false;
	if(buffer == emptyID)
		return false;
	for(auto& iBuffer : bufferP){
		if(iBuffer.get() == reinterpret_cast<uint8_t*>(buffer))
			return true;
	}
	return false;
}

ObjectID GPU::createVertexPuller(){
	vertexTable *item = new vertexTable();
	item->heads = std::vector<headSetting>(10);
	vertexSettings.push_back(item);
	return  vertexSettings.size()-1;
  return emptyID;
}

void GPU::deleteVertexPuller(VertexPullerID vao){
	delete vertexSettings[vao];
	vertexSettings[vao] = NULL;
}

void GPU::setVertexPullerHead(VertexPullerID vao,uint32_t head,AttributeType type,uint64_t stride,uint64_t offset,BufferID buffer){
	vertexSettings[vao]->heads[head] = {buffer, offset,stride, type, false};
}

void GPU::setVertexPullerIndexing(VertexPullerID vao,IndexType type,BufferID buffer){
	vertexSettings[vao]->id = buffer;
	vertexSettings[vao]->idxType = type;
}

void GPU::enableVertexPullerHead (VertexPullerID vao,uint32_t head){
  vertexSettings[vao]->heads[head].enabled = true;
}

void GPU::disableVertexPullerHead(VertexPullerID vao,uint32_t head){
	vertexSettings[vao]->heads[head].enabled = false;
}
void GPU::bindVertexPuller(VertexPullerID vao){
 activePuller = vao;
}
void GPU::unbindVertexPuller(){
  activePuller = emptyID;
}

bool GPU::isVertexPuller(VertexPullerID vao){
	if(vao == emptyID || vao >= vertexSettings.size())
		return false;
	if(vertexSettings[vao] != NULL)
		return true;
  return false;
}

ProgramID GPU::createProgram(){
  	auto settings = std::make_unique<prg>();
  	auto id = reinterpret_cast<ProgramID>(settings.get());
	program.push_back(std::move(settings));
	return id;
  return emptyID;
}

void GPU::deleteProgram(ProgramID prg){
	for(auto &isettings : program){
		if( isettings.get() == reinterpret_cast<struct prg*>(prg))
			isettings.release();
	}
}

void GPU::attachShaders(ProgramID prg,VertexShader vs,FragmentShader fs){
	for(auto &isettings : program){
		if( isettings.get() == reinterpret_cast<struct prg*>(prg)) {
			isettings->vs = vs;
			isettings->fs = fs;
		}
	}
}

void GPU::setVS2FSType (ProgramID prg,uint32_t attrib,AttributeType type){
	for(auto &isettings : program){
		if( isettings.get() == reinterpret_cast<struct prg*>(prg))
			isettings->VS2FS.push_back({attrib,type});
	}
}

void GPU::useProgram(ProgramID prg){
  activeProgram = prg;
}

bool GPU::isProgram(ProgramID prg){
	if(prg == emptyID || prg == 0)
		return false;
	for(auto &isettings : program){
		if( isettings.get() == reinterpret_cast<struct prg*>(prg))
			return true;
	}
  return false;
}

void GPU::programUniform1f(ProgramID prg, uint32_t uniformId, float const&d){

	for(auto &isettings : program){
		if( isettings.get() == reinterpret_cast<struct prg*>(prg))
			isettings->un.uniform[uniformId].v1 = d;
	}
}

void GPU::programUniform2f (ProgramID prg, uint32_t uniformId, glm::vec2 const&d) {
	for (auto &isettings : program) {
		if (isettings.get() == reinterpret_cast<struct prg *>(prg))
			isettings->un.uniform[uniformId].v2 = d;
	}
}

void GPU::programUniform3f (ProgramID prg, uint32_t uniformId, glm::vec3 const&d){
	for (auto &isettings : program)
		if (isettings.get() == reinterpret_cast<struct prg *>(prg))
			isettings->un.uniform[uniformId].v3 = d;
}

void GPU::programUniform4f (ProgramID prg, uint32_t uniformId, glm::vec4 const&d){
	for (auto &isettings : program)
		if (isettings.get() == reinterpret_cast<struct prg *>(prg))
			isettings->un.uniform[uniformId].v4 = d;
}

void GPU::programUniformMatrix4f(ProgramID prg, uint32_t uniformId, glm::mat4 const&d){
	for (auto &isettings : program)
		if (isettings.get() == reinterpret_cast<struct prg *>(prg))
			isettings->un.uniform[uniformId].m4 = d;
}

void GPU::createFramebuffer(uint32_t width, uint32_t height){
	fBuf.color = std::vector<uint8_t >(width*height*4);
	fBuf.depth = std::vector<float >(width*height);
	fBuf.width = width;
	fBuf.height = height;
}

void GPU::deleteFramebuffer(){
}

void GPU::resizeFramebuffer(uint32_t width, uint32_t height){
	fBuf.color = std::vector<uint8_t>(width*height*4);
	fBuf.depth = std::vector<float>(width*height);
	fBuf.width = width;
	fBuf.height = height;
}

uint8_t* GPU::getFramebufferColor(){
	return fBuf.color.data();
}

float* GPU::getFramebufferDepth (){
	return fBuf.depth.data();
}

uint32_t GPU::getFramebufferWidth(){
  return fBuf.width;
}

uint32_t GPU::getFramebufferHeight(){
  return fBuf.height;
}

void GPU::clear(float r, float g, float b, float a){
  for(int i = 0;i < getFramebufferWidth()*getFramebufferHeight();i++){
  	fBuf.depth[i] = 1.1f;
  	int offset = i*4;
  	fBuf.color[offset] = r*255;
	fBuf.color[offset + 1] = g*255;
	fBuf.color[offset + 2] = b*255;
	fBuf.color[offset + 3] = a*255;
	}
}

//get vertices with all atributes avaible
void GPU::pullVertex(InVertex &in,VertexPullerID activePuller,int offset){
	for(int i = 0;i < 10; i++){
		if(vertexSettings[activePuller]->heads[i].enabled){
			//float32
				getBufferData(vertexSettings[activePuller]->heads[i].id, vertexSettings[activePuller]->heads[i].offset + offset*vertexSettings[activePuller]->heads[i].stride,
						(uint64_t) vertexSettings[activePuller]->heads[i].type*4, &in.attributes[i]);
		}
	}
}

void GPU::rasterizace(std::array<OutVertex, 3> primitive) {
	int minx = INT32_MAX, maxx = 0, miny = INT32_MAX, maxy = 0;
	//local minmax
	for (int i = 0; i < 3; i++) {
		minx = (minx > primitive[i].gl_Position[0]) ? primitive[i].gl_Position[0] : minx;
		maxx = (maxx < primitive[i].gl_Position[0]) ? primitive[i].gl_Position[0]+1 : maxx;
		miny = (miny > primitive[i].gl_Position[1]) ? primitive[i].gl_Position[1] : miny;
		maxy = (maxy < primitive[i].gl_Position[1]) ? primitive[i].gl_Position[1]+1 : maxy;
	}
	/*if(minx < 0)
	    minx = 0;
    if(miny < 0)
        miny = 0;
    if(maxx > getFramebufferWidth())
        maxx = getFramebufferWidth();
    if(maxy > getFramebufferHeight())
        maxy = getFramebufferHeight();*/
	InFragment myFragment;
	OutFragment fragOut;
	//h - face to face, b - face to point
	std::vector<float> h[3], b[3];

	float s[3];
	float dotProduct[3];
    auto program = reinterpret_cast<struct prg*>(activeProgram);
	//inside
	h[0] = {primitive[1].gl_Position[0] - primitive[0].gl_Position[0],
			primitive[1].gl_Position[1] - primitive[0].gl_Position[1]};
	h[1] = {primitive[2].gl_Position[0] - primitive[1].gl_Position[0],
			primitive[2].gl_Position[1] - primitive[1].gl_Position[1]};
	h[2] = {primitive[0].gl_Position[0] - primitive[2].gl_Position[0],
			primitive[0].gl_Position[1] - primitive[2].gl_Position[1]};

	//PINED ALGORITHM (zig-zag)

    for (int i = 0; i < 3; i++) {
        b[i] = {minx + 0.5f - primitive[i].gl_Position[0], miny + 0.5f - primitive[i].gl_Position[1]};
        dotProduct[i] = h[i][0] * b[i][1] - b[i][0] * h[i][1];
    }

    int lineCount=0;
    for(int y = miny; y < maxy; y++) {
        if( lineCount != 0){
            dotProduct[0] += h[0][0];
            dotProduct[1] += h[1][0];
            dotProduct[2] += h[2][0];
        }
        int increment, limit, start;
        if( lineCount % 2 == 0){
            increment = 1;
            limit = maxx+1;
            start = minx;
        } else{
            increment = -1;
            limit = minx-1;
            start = maxx;
        }
        int x = start;
        while (x != limit){
            if( x != start){
                dotProduct[0] -= increment * h[0][1];
                dotProduct[1] -= increment * h[1][1];
                dotProduct[2] -= increment * h[2][1];
            }

            if (dotProduct[0] >= 0 && dotProduct[1] >= 0 && dotProduct[2] >= 0) {
                myFragment.gl_FragCoord = {x + 0.5f, y + 0.5f, 1, 1};

                for (int i = 0; i < 3; i++) {
                    b[i] = {myFragment.gl_FragCoord.x - primitive[i].gl_Position[0], myFragment.gl_FragCoord.y - primitive[i].gl_Position[1]};
                }
                //obsahy
                s[0] = h[1][0] * b[1][1] - h[1][1] * b[1][0];
                s[1] = h[2][0] * b[2][1] - h[2][1] * b[2][0];
                s[2] = h[0][0] * b[0][1] - h[0][1] * b[0][0];

                float l0h0 = s[0] / primitive[0].gl_Position[3];
                float l1h1 = s[1] / primitive[1].gl_Position[3];
                float l2h2 = s[2] / primitive[2].gl_Position[3];
                float optdivisor = l0h0 + l1h1 + l2h2;

                myFragment.gl_FragCoord.z = (primitive[0].gl_Position[2] * l0h0 +
                                             primitive[1].gl_Position[2] * l1h1 +
                                             primitive[2].gl_Position[2] * l2h2) / optdivisor;

                /*myFragment.gl_FragCoord.w = (primitive[0].gl_Position[3] * l0h0 +
                                             primitive[1].gl_Position[3] * l1h1 +
                                             primitive[2].gl_Position[3] * l2h2) / optdivisor;*/

                //interpolate every atribute (z correct)
                for (auto iVS2FS : program->VS2FS) {
                    uint32_t atr = iVS2FS.attrib;
                    AttributeType typ = iVS2FS.type;

                    if (typ == AttributeType::FLOAT)
                        myFragment.attributes[atr].v1 =
                                (primitive[0].attributes[atr].v1 * l0h0 +
                                 primitive[1].attributes[atr].v1 * l1h1 +
                                 primitive[2].attributes[atr].v1 * l2h2) / optdivisor;
                    else if (typ == AttributeType::VEC2) {
                        myFragment.attributes[atr].v2 =
                                (primitive[0].attributes[atr].v2 * l0h0 +
                                 primitive[1].attributes[atr].v2 * l1h1 +
                                 primitive[2].attributes[atr].v2 * l2h2) / optdivisor;
                    } else if (typ == AttributeType::VEC3) {
                        myFragment.attributes[atr].v3 =
                                (primitive[0].attributes[atr].v3 * l0h0 +
                                 primitive[1].attributes[atr].v3 * l1h1 +
                                 primitive[2].attributes[atr].v3 * l2h2) / optdivisor;

                    } else if (typ == AttributeType::VEC4) {
                        myFragment.attributes[atr].v4 =
                                (primitive[0].attributes[atr].v4 * l0h0 +
                                 primitive[1].attributes[atr].v4 * l1h1 +
                                 primitive[2].attributes[atr].v4 * l2h2) / optdivisor;
                    }
                }
                //lover depth - set pixel
                //fragment Processor
                program->fs(fragOut,myFragment,program->un);
                int offset = x + getFramebufferWidth() * y;
                if (myFragment.gl_FragCoord.z < fBuf.depth[offset]) {
                    if (offset < 0 || offset > getFramebufferWidth() * getFramebufferHeight())
                        continue;//buffer borders

                    fBuf.depth[offset] = myFragment.gl_FragCoord[2];
                    fragOut.gl_FragColor *= 255;
                    offset *= 4;
                    fBuf.color[offset] = fragOut.gl_FragColor.r;
                    fBuf.color[offset + 1] = fragOut.gl_FragColor.g;
                    fBuf.color[offset + 2] = fragOut.gl_FragColor.b;
                    fBuf.color[offset + 3] = fragOut.gl_FragColor.a;
                }
            }
            x+= increment;
        }
    lineCount++;
    }
}


void GPU::getPrimitive(uint32_t nofVertices, int p,std::vector<std::array<OutVertex, 3>> &primitive){

    auto program = reinterpret_cast<struct prg*>(activeProgram);
    InVertex ivertex[3];
    auto overtex = std::vector<OutVertex>(3);
    OutVertex help;

	for(int j = 0; j < nofVertices/3;j++){

	for(int i=0;i<3;i++){
		//neindex
		if(vertexSettings[activePuller]->id == 0){
			ivertex[i].gl_VertexID = p;
			p++;
		}
		else{
			ivertex[i].gl_VertexID = 0;//<- nefunguje bez
			//load index
			getBufferData(vertexSettings[activePuller]->id, (int)vertexSettings[activePuller]->idxType * p, (int)vertexSettings[activePuller]->idxType, &ivertex[i].gl_VertexID);
			p++;
		}
		pullVertex(ivertex[i], activePuller, ivertex[i].gl_VertexID);

	}
	//vertexProcessor()
	for(int i=0;i<3;i++){
		program->vs(overtex[i],ivertex[i],program->un);
	}
	//CLIPING PART
	float t;
	//calculating new points + interpolation
	for(int i = 0; i < 3;i++){
		float divvect;
		//choosing vector
		if(i==2)
			divvect = overtex[0].gl_Position[3] - overtex[2].gl_Position[3] + overtex[0].gl_Position[2] - overtex[2].gl_Position[2];
		else
			divvect = overtex[i+1].gl_Position[3] - overtex[i].gl_Position[3] + overtex[i+1].gl_Position[2] - overtex[i].gl_Position[2];

		t = (-overtex[i].gl_Position[3] - overtex[i].gl_Position[2] )/divvect;
		//toCull
		if(t > 0 && t < 1) {

			if(i==2)
				help.gl_Position = overtex[2].gl_Position + t*(overtex[0].gl_Position - overtex[2].gl_Position);
			else{
				help.gl_Position = overtex[i].gl_Position + t*(overtex[i+1].gl_Position - overtex[i].gl_Position);
			}

			//interpolate atributes to new vertices
			for(int z = 0; z < maxAttributes; z++){
				if(i==2){
					help.attributes[z].v1 = overtex[2].attributes[z].v1 + t*(overtex[2].attributes[z].v1 - overtex[0].attributes[z].v1);
					help.attributes[z].v2 = overtex[2].attributes[z].v2 + t*(overtex[2].attributes[z].v2 - overtex[0].attributes[z].v2);
					help.attributes[z].v3 = overtex[2].attributes[z].v3 + t*(overtex[2].attributes[z].v3 - overtex[0].attributes[z].v3);
					help.attributes[z].v4 = overtex[2].attributes[z].v4 + t*(overtex[2].attributes[z].v4 - overtex[0].attributes[z].v4);
				}
				else {
					help.attributes[z].v1 = overtex[i].attributes[z].v1 + t * (overtex[i+1].attributes[z].v1 - overtex[i].attributes[z].v1);
					help.attributes[z].v2 = overtex[i].attributes[z].v2 + t * (overtex[i+1].attributes[z].v2 - overtex[i].attributes[z].v2);
					help.attributes[z].v3 = overtex[i].attributes[z].v3 + t * (overtex[i+1].attributes[z].v3 - overtex[i].attributes[z].v3);
					help.attributes[z].v4 = overtex[i].attributes[z].v4 + t * (overtex[i+1].attributes[z].v4 - overtex[i].attributes[z].v4);
				}
			}
			overtex.push_back(help);
		}
	}

		bool delFlag=false;
        //delete old vertices
		for (int j = 2; j >= 0; j--) {
			if (-overtex[j].gl_Position[3] > overtex[j].gl_Position[2]) {
				overtex.erase(overtex.begin() + j);
				delFlag = true;

			}
		}

		//empty
		const glm::vec4 bad{0,0,0,0};
			if(overtex[0].gl_Position == bad){
				continue;
			}

		//asembly
		if(overtex.size() == 3){
			if(!delFlag)
				primitive.push_back({overtex[0], overtex[1], overtex[2]});
			else
				primitive.push_back({overtex[2], overtex[1], overtex[0]});
		}
		if(overtex.size() == 4){
			primitive.push_back({overtex[0], overtex[1], overtex[2]});
			primitive.push_back({overtex[0], overtex[2], overtex[3]});
		}

	}

}

void GPU::drawTriangles (uint32_t  nofVertices){
  int p = 0;
  //pole primitiv
  auto primitive = std::vector<std::array<OutVertex, 3>>();
  getPrimitive(nofVertices,p,primitive);
  for( auto& iprimitive : primitive){

		for(int j = 0; j < 3;j++){
			//perspektivni deleni
			for(int g = 0; g < 3; g++){
				iprimitive[j].gl_Position[g] /= iprimitive[j].gl_Position[3];
			}
			//viewport transf
			iprimitive[j].gl_Position[0] += 1;
			iprimitive[j].gl_Position[1] += 1;
			iprimitive[j].gl_Position[0] *= getFramebufferWidth()/2;
			iprimitive[j].gl_Position[1] *= getFramebufferHeight()/2;
		}
        rasterizace(iprimitive);
  }
}
