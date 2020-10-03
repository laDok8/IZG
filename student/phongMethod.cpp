/*!
 * @file
 * @brief This file contains implementation of phong rendering method
 *
 * @author Tomáš Milet, imilet@fit.vutbr.cz
 */

#include <student/phongMethod.hpp>
#include <student/bunny.hpp>


void phong_VS(OutVertex&outVertex,InVertex const&inVertex,Uniforms const&uniforms){
	auto const& pos   = inVertex.attributes[0].v3;
	auto const& mvp   = uniforms.uniform[1].m4*uniforms.uniform[0].m4;

	outVertex.attributes[0].v3 = pos;
	outVertex.attributes[1].v3 = inVertex.attributes[1].v3;
	outVertex.gl_Position = mvp*glm::vec4(pos,1.f);
}

void phong_FS(OutFragment&outFragment,InFragment const&inFragment,Uniforms const&uniforms){
	glm::vec3 pos = inFragment.attributes[0].v3;
	glm::vec3 norm = inFragment.attributes[1].v3;
	glm::vec3 light = uniforms.uniform[2].v3;

    //Compute PhongLighting
    glm::vec3 lightVectNorm = glm::normalize(light-pos);
    float lightDotNorm = glm::dot(glm::normalize(norm), lightVectNorm);
    //optimalizace odvracene norm - cerna barva
    if(lightDotNorm <= 0.f) {
        outFragment.gl_FragColor = glm::vec4(0.f);
        return;
    }

	glm::vec3 camera = uniforms.uniform[3].v3;
	glm::vec3 defColor;
	float white = 1.f;//snow and light color 1 - no need to multiply
	float t;

	//sinewave texture
	if(glm::fract(5.f*(pos.x+glm::sin(pos.y*10.f)/10.f)) < 0.5f)
		defColor = {0.f,0.5f,0.f};
	else
		defColor = {1.f,1.f,0.f};

	//snow normal
	if(norm.y < 0)
		t = 0;
	else
		t = glm::pow(norm.y,2);
	//snow;
	outFragment.gl_FragColor = {defColor + t*(white-defColor),0.f};

    float diffuse = lightDotNorm;
    float specular = glm::pow(glm::clamp(glm::dot(lightVectNorm, -glm::reflect(glm::normalize(camera-pos),norm)),0.f,1.f),40.f);

	outFragment.gl_FragColor = diffuse*outFragment.gl_FragColor+specular;
	outFragment.gl_FragColor = glm::clamp(outFragment.gl_FragColor,0.f,1.f);


}

PhongMethod::PhongMethod(){

vao  = gpu.createVertexPuller();
prg =  gpu.createProgram();
gpu.attachShaders(prg, phong_VS, phong_FS);
buf = gpu.createBuffer(sizeof(bunnyVertices));
bufInd = gpu.createBuffer(sizeof(bunnyIndices));
gpu.setBufferData(buf,0,sizeof(bunnyVertices),&bunnyVertices);
gpu.setBufferData(bufInd,0,sizeof(bunnyIndices),&bunnyIndices);
gpu.setVertexPullerHead(vao,0,AttributeType::VEC3,sizeof(bunnyVertices[0]),0,buf);
gpu.setVertexPullerHead(vao,1,AttributeType::VEC3,sizeof(bunnyVertices[0]),sizeof(bunnyVertices[0])/2,buf);
gpu.setVertexPullerIndexing(vao, IndexType::UINT32 , bufInd);
gpu.enableVertexPullerHead(vao,0);
gpu.enableVertexPullerHead(vao,1);
gpu.setVS2FSType(prg,1, AttributeType::VEC3);
gpu.setVS2FSType(prg,0, AttributeType::VEC3);

}

void PhongMethod::onDraw(glm::mat4 const&proj,glm::mat4 const&view,glm::vec3 const&light,glm::vec3 const&camera){

  gpu.clear(.5f,.5f,.5f,1.f);
  gpu.bindVertexPuller(vao);
  gpu.useProgram(prg);

  gpu.programUniformMatrix4f(prg,1, proj);
  gpu.programUniformMatrix4f(prg,0, view);
  gpu.programUniform3f(prg,2, light);
  gpu.programUniform3f(prg,3, camera);
  gpu.drawTriangles(sizeof(bunnyIndices)/sizeof(decltype(bunnyIndices[0]))*3);

  gpu.unbindVertexPuller();

}

PhongMethod::~PhongMethod(){
	gpu.deleteProgram(prg);
	gpu.deleteVertexPuller(vao);
}
