import xml.etree.ElementTree as ET
import sys

pomFileTree = ET.parse('pom.xml')
ET.register_namespace("","http://maven.apache.org/POM/4.0.0")

def getVer():
    version = ""
    root = pomFileTree.getroot()
    for child in root:
        if "version" in child.tag:
            version = child.text
    return version


def setVer(version):
    root = pomFileTree.getroot()
    for child in root:
        if "version" in child.tag:
            child.text = version
    pomFileTree.write("pom.xml")

def bumpPatch(version):
    versionSplit = version.split('.')
    patch = int(versionSplit[2])
    newPatch = patch + 1
    newVersion = versionSplit[0] + "." + versionSplit[1] + "." + str(newPatch) 
    return newVersion


def main():
   version = getVer()
   bumpedVer = bumpPatch(version)
   setVer(bumpedVer)
   # get version to terminal
   sys.stdout.write(bumpedVer)

  
if __name__ == "__main__":
  main()
