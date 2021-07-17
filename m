Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BC177
	for <tools@linux.kernel.org>; Sat, 17 Jul 2021 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626555012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=nKlOPfbhYHSdIgTZjM+8T18FqG/9F9guQFq+Z83DNRE=;
	b=ObdchYLRPL5F5JCT2eFIHSah54vKhUuoAonn2p0EW0sektvkG76r04o+lwDW/F3ngCKVC8
	fPm9iMH5cRAROwabuZoywKtVFFAePyUbCmJq22vNaX2EA9wiA7e76Eu+o6app96s4AdA++
	wbyckW9iFFV6ZQunYM7CQnOWdX6ThaU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Vw1DGqtJMninM1KsCOdORg-1; Sat, 17 Jul 2021 16:50:10 -0400
X-MC-Unique: Vw1DGqtJMninM1KsCOdORg-1
Received: by mail-ed1-f72.google.com with SMTP id g23-20020aa7c8570000b02903954c05c938so1197710edt.3
        for <tools@linux.kernel.org>; Sat, 17 Jul 2021 13:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=nKlOPfbhYHSdIgTZjM+8T18FqG/9F9guQFq+Z83DNRE=;
        b=SvLHg2RH5iSODKXR1gn2keNvz2gYj4ukhJEpbWlKTQe0Gk/jIwSPCiChIAtXSlIu2h
         v/Yeh1XsEPvbIbYi9Zq6h9mMxt4qZLvLtkzuHS77NK6D/o4soHXlgnM2UlF1J4/4FXOI
         FtOwRBPNMqoTVPSd3BZyJ8dsnmyITGwexmx3PmXPlbB/P7YtvW8hZueWqH1d9ezDWRuc
         bs0iUg+pdl/Bgukpajt6SgiyDxIBwSqcHXn4KfsN9lLdigTTk/O10EfJTTRMv9XEQJEg
         sz9AkRPXqwWvw6KAz7NM0EdYAfaINAbgoSZUuVrIgVmryomFf53Ja3VuHEzDe9NI9GFo
         Y1OQ==
X-Gm-Message-State: AOAM5313JPlKDG0KperPCTTCDxUgJkHJyloA7QaFpwcWEcM5+xCAV7g1
	zNahay0S8ccY/9RSFT4dNq1wLVGBd8qgsmCg6gd/KXKFYvN6dhzKnyE/0MtXkzitMcem0nN3f7y
	kAIp/K4aEN3L7TJ/n
X-Received: by 2002:a17:906:c256:: with SMTP id bl22mr19653675ejb.115.1626555009493;
        Sat, 17 Jul 2021 13:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSUP5GFymscaUIa4wZ7dbgDYzbd06Ms2/xAEUSfrHWp7TOsvsCr8GCDha+gHc/KkyEbomwig==
X-Received: by 2002:a17:906:c256:: with SMTP id bl22mr19653660ejb.115.1626555009323;
        Sat, 17 Jul 2021 13:50:09 -0700 (PDT)
Received: from redhat.com ([2.55.29.175])
        by smtp.gmail.com with ESMTPSA id p5sm1745165ejl.73.2021.07.17.13.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:50:08 -0700 (PDT)
Date: Sat, 17 Jul 2021 16:50:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: utf-8 issues on b4 master
Message-ID: <20210717164836-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Passing message id
bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com to b4
gives this backtrace:

Traceback (most recent call last):
  File "/scm/b4/b4/command.py", line 263, in <module>
    cmd()
  File "/scm/b4/b4/command.py", line 246, in cmd
    cmdargs.func(cmdargs)
  File "/scm/b4/b4/command.py", line 41, in cmd_mbox
    b4.mbox.main(cmdargs)
  File "/scm/b4/b4/mbox.py", line 581, in main
    msgid, msgs = get_msgs(cmdargs)
  File "/scm/b4/b4/mbox.py", line 523, in get_msgs
    msgid = b4.get_msgid(cmdargs)
  File "/scm/b4/b4/__init__.py", line 2080, in get_msgid
    msgid = get_msgid_from_stdin()
  File "/scm/b4/b4/__init__.py", line 2072, in get_msgid_from_stdin
    message = email.message_from_string(sys.stdin.read())
  File "/usr/lib64/python3.9/codecs.py", line 322, in decode
    (result, consumed) = self._buffer_decode(data, self.errors, final)
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd4 in position 5886: invalid continuation byte

mutt does not seem to have trouble decoding this ... weird.
-- 
MST

