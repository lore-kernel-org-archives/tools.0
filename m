Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.32663.1608510106396644377
 for <tools@linux.kernel.org>;
 Sun, 20 Dec 2020 16:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d9jya2vz;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id a6so5599691qtw.6
        for <tools@linux.kernel.org>; Sun, 20 Dec 2020 16:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mOPmBStUfS5HlY98FoJBPH0eSVeh3w+2bYl1wJuTW2E=;
        b=d9jya2vzTN4vMgN6HNecwOxw1aI22wad4M1A8qhp4ZXDnQtxwpeffE1YI7WaynjUxr
         L387UEDpjzFK1Xyotq1YBX5k7YT0P0vZxfGgRkdtqTI6Z81luJ2ILJKwMxim0aREZ0bv
         HHqsU46rkoOD4Ixzidp8X0o6GMD/Uyy3qTpV+iVKfeLNMlOaz4gT5H7nSeyWfyH7SLkF
         kgwsgJcjcBdfVqwMqnkUK2/k8VbYFRbBx29yQvE+zWs38S65zjdek/FzZWPxzdmWNvxV
         JwBmltdm9wje5Wgdxm0daIm1FOsjPI9FA7QJb/bofQZKWeW5TbxKMfgw2cT9ySVp7IHZ
         SfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mOPmBStUfS5HlY98FoJBPH0eSVeh3w+2bYl1wJuTW2E=;
        b=bxtUXtr5nL4mZ8Qjw7v4v2/2sElRwQxjEArIEZ0oIaO8pdVL8x9hkkGBnReiGagQwe
         aw/ghxcn30SMAN8WZUoOHZzvxeovTPm5zLRKsan1hnMBolOKbhBqL/Gp+tP6fcGwjpyZ
         DR3s8k+6iAZ2/S06aQJKjKtTr/6qfMbZS0PF0fP+ZIlkSIARqPbxoJCh2snHvEUZ8sTy
         /qCisab70e8Ey0cRGAlI6RiaSzgkPLJ4nUxXagBY1l+AQwCysaKMB7Vd8wjHaOiGodq3
         LGcI0nvnkeJ+lsuwhHl7JipSA/BmQVr+doO+T6wpS7EjO0bGzgnVYYv7okv/7IChoGCy
         J4vQ==
X-Gm-Message-State: AOAM532Db1uGHC3mD/aSiXE/jWzVwH5xf0jpDU6jCAfJJ64ys++uIwmM
	mfbgl6KeJolG/E45vF/NUcg=
X-Google-Smtp-Source: ABdhPJxzFoeq/fHKJmWxwbwKkRpKxiYUsIc+irOnBkb1XikeL6CEvRbbm5u8KidxHkIMkvlAgbk4lQ==
X-Received: by 2002:ac8:6659:: with SMTP id j25mr14540958qtp.322.1608510105618;
        Sun, 20 Dec 2020 16:21:45 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id u20sm9870552qtb.9.2020.12.20.16.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 16:21:44 -0800 (PST)
To: tools@linux.kernel.org
From: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: konstantin@linuxfoundation.org
Subject: [b4] make 'b4 mbox' reorder headers so piping to 'git imap-send' works
Message-ID: <7e6329fa-e5fa-c5af-002d-a8fbb60e0724@gmail.com>
Date: Sun, 20 Dec 2020 19:21:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit

Hi,

I'm using 'b4 mbox -o- <url> | git imap-send' to quickly import
threads to my email account when I see an interesting thread that
I'd like to reply to (I contribute to Git but I'm not subscribed to the
Git mailing list).

This only works if the emails in the threads have the 'From', 'Date'
and 'Subject' headers in exactly that order, because that order is
hard-coded in 'git imap-send' [1]. I wrote a small script [2] that
just reads the headers and reorders them accordingly but I'd like to
just use 'b4 mbox' instead as it has more features. However I discovered
that such reordering is not done by b4. For example, this fails as 'git imap-send'
reports 'nothing to send':

b4 mbox -o- https://lore.kernel.org/git/op.0vvmwohypvqxoc@damia/T/#u | git imap-send

It would be nice if b4 would take care of the reordering.

Cheers,

Philippe.

[1] https://git-scm.com/docs/git-imap-send#_description
[2] https://gist.github.com/phil-blain/d350e91959efa6e7afce60e74bf7e4a8
