Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC594428
	for <tools@linux.kernel.org>; Tue, 30 Aug 2022 17:00:22 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id c9so8887851qkk.6
        for <tools@linux.kernel.org>; Tue, 30 Aug 2022 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:from:to:cc;
        bh=9HvJcj85cY5aewFyxr/xBGxadeau6nZdKBzjxA2Mkcg=;
        b=SkdkYEfvwjTYYKrfuvLHN8v0UDPqEqo/9HOTL6/jrVTxPtCUcFERXM5DnbFW740f46
         p9gtrp2xLdihWXRtODYBQJ0dESKgVNzdra7tY+MXMQ4OWi+0tKjVNW5hYuV4kNGzwBax
         Kn2TnvlHLDwPRWfnTOSIHoFZqJ9Om/Unz/EvjvtaY4QthDwIk2CSV92EUHk0m3+cWOTR
         uXB3JZSt6xmBWk+px1lFw0Gu7zud9wwp9ZKasAmTyVmf9OQw3f8Fr8NOUBgz8UI1d1JH
         5LK1bxB4dyJ7QQWHO6aSGdYceOQ0LTH/oVAsRf/Y6kD9rnvA4WP273FIsLvICDdrbR9y
         e5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:x-gm-message-state:from:to:cc;
        bh=9HvJcj85cY5aewFyxr/xBGxadeau6nZdKBzjxA2Mkcg=;
        b=2C6O1IEqzDT2pmbNEWrCNWFpBsl8H6ydqWe+OPwEbyiV1VJT9W5MCI3hk3tQkuDlnW
         xZ4lzrH7PN10Uvo5ZWF+zfv+uoyql6cAPnEkZmWgI7FoIF3qigKJ4qIJiHYw32UeI/Fm
         SaFjtdslRt5abwP71by2CFqhkYjaWiLziuqlOJy5zAmeCWdwOAF/wzQdMyrwvoffoVDk
         Kx5QMtDRWDSoOpv2Ei+K6wOky2AAEYYnWN/RjooaOsklfTkNbdn1YqNHfsPyeiQHyyUZ
         Zi3egP9oMEPOG0LUbFdT/8ZPWT5iJDvFKT5mn+FtpTuTyjplKa6ydveCLhT4IH/01ICV
         M6tg==
X-Gm-Message-State: ACgBeo1SXeiIx5+gCMCBmyGkVH16GvHpKpGoxgZpgXBFnTVNvYi3UCMM
	LD0I2PVE4XPzsISK1dbCn2hEoJxdGHM=
X-Google-Smtp-Source: AA6agR6Uab5nEfkkB1Lry+B8sFHxnPm8ZgBhCkeneK3XfDVuGohaQ9bJRmfexwrj/3eXwgBpkxz4NA==
X-Received: by 2002:a05:620a:129b:b0:6bb:581c:4433 with SMTP id w27-20020a05620a129b00b006bb581c4433mr12506476qki.476.1661878821396;
        Tue, 30 Aug 2022 10:00:21 -0700 (PDT)
Received: from [192.168.1.127] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id z198-20020a3765cf000000b006b8619a67f4sm7896177qkb.34.2022.08.30.10.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:00:21 -0700 (PDT)
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: Using b4 with full URLs still uses lore.kernel.org by default
Message-ID: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>
Date: Tue, 30 Aug 2022 13:00:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Following the launch of inbox.sourceware.org [1], I've been trying out
b4 with it. I noticed that even if I use a full URL (for example, copied
from my browser), b4 still rewrites the URL to lore.kernel.org.

For example:

$ b4 mbox -o- https://inbox.sourceware.org/gdb-patches/cover.1661868744.git.aburgess@redhat.com/T/#t
Grabbing thread from lore.kernel.org/gdb-patches/cover.1661868744.git.aburgess%40redhat.com/t.mbox.gz
Server returned an error: 404

It does work correctly if I set 'b4.midmask' to 'https://inbox.sourceware.org/r/%s'
in my local Git config file, but sometimes I used b4 outside of any Git 
repository just to transfer threads to my IMAP account (piping b4 mbox to git imap-send)
so it would be convenient if full URLs were not re-written.

Cheers,
Philippe.


[1] https://inbox.sourceware.org/gdb/1d561611c7c2b064ba847b004e80bb03588d827b.camel@klomp.org/T/#u
