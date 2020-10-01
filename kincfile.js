let project = new Project('Game');

project.addFile('Sources/**');
// NOTE: Update to use the correct path
project.addIncludeDir('C:/Users/<fix-here>/.choosenim/toolchains/nim-1.2.4/lib');

project.setDebugDir('Deployment');


resolve(project);
