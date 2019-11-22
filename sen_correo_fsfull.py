#!/usr/bin/env python

import email.mime.text
import smtplib

username = 'monitoreo@gibitnet.com.mx'
password = 'Gibitnet2007*'
hostname = 'gibitnet.com.mx'

msg = email.mime.text.MIMEText('ALERTA de file system lleno')
msg['Subject'] = 'Alerta de File system'
msg['From'] = 'monitoreo@gibitnet.com.mx'
msg['To'] = 'marionoguez@gibitnet.com.mx'

server = smtplib.SMTP(hostname, 25)
server.ehlo()
server.starttls()
server.ehlo()
server.login(username, password)
server.sendmail(
        'monitoreo@gibitnet.com.mx',
        ['marionoguez@gibitnet.com.mx'],
        msg.as_string(),
        )
server.close()
