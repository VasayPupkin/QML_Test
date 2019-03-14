#ifndef CSVREADER_H
#define CSVREADER_H

#include <QObject>

class CSVReader : public QObject
{
  Q_OBJECT
  public:
  explicit CSVReader(QObject *parent = nullptr);

  signals:
  void renameButton();

  public slots:
  void parseFileName(QString fileName);
};

#endif // CSVREADER_H
