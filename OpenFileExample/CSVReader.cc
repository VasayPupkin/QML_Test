#include <QString>
#include "CSVReader.h"

CSVReader::CSVReader(QObject *parent) : QObject(parent)
{

}

void CSVReader::parseFileName(QString fileName)
{
  QString str = fileName;
  int i = 0;
  ++i;
  emit renameButton();
}
