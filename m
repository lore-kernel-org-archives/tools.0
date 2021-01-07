Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web08.8851.1610029210011683726
 for <tools@linux.kernel.org>;
 Thu, 07 Jan 2021 06:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IhYYZGDf;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id n9so6891316ili.0
        for <tools@linux.kernel.org>; Thu, 07 Jan 2021 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=58cLQdMfBs7CPdO82QAfU6Z/pbDo4y1Aia+/2e0kM84=;
        b=IhYYZGDfiyQehe3tjkaHf1vjjziy0DbuNeH7HXy1sDai3JiXZtsQ1xhTy9JgsZ1zQ1
         CfUZj1uInRaerU7l2R1t/4QvA2M70whQO/py7DQxBr3m/ujVZnh4GWHhW+Qz77OReG9/
         lAqFr7TWNTcYdoo7C2LxdKgfTSlEjql634/ODxoccTqC1DOohmJQkCAsUtl6lqkVxZPh
         1rnr9Pw4nND/tWdwsyP22rvZb1ucWqT3lgcZEoY8Vt4TW3l6UB9ZpIBrQsqUXt3c9yaB
         g/wQxPQ/xPkGvp/vfRYjZd4xNLXXD1yvwl2pedALzOz7D24WRLIy2IP6VW7yAMsbIHA5
         rxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=58cLQdMfBs7CPdO82QAfU6Z/pbDo4y1Aia+/2e0kM84=;
        b=SEViCAJwkQUOnsJupuKyJxtDl/v5NZqc20isoLxnJ3lMWKq/OD4hGKwWwteXtvwwvB
         eYDXSv0ZfhwWSsGY0NK0KGA/H/r5wklJs/14Sl5YEdiCoLNBZ7XBrAoM6TaaHBcRKQ3i
         vfCvG+6kNLetwLyKvzkP68+nBwhaijbS1cRTw7DjUwMXew4D8Lulr9+u0SXW73e/Ynn8
         gRmYfyt2nCXaUhYJHDlKJFGY3jCOMG/VhyEOrIbAP15mi1R/b4SEdu4hOvoGerZyDdut
         XhyiUl23E6aOCQOjSUbpyBtBVfzDKudgs0F7vsrbFlM7hxoqZ1RjiosuM30syahZ+Exz
         Nywg==
X-Gm-Message-State: AOAM531hA87g0nj4DMPYKSQOAU1XONZzaIvMQcuNEFRM3J7qNgx8PlWK
	TfNxYxnNge9VbdtPZ5BUJYU=
X-Google-Smtp-Source: ABdhPJyiiB3P75ysW3KlQ6ylqoqRwjjrMVq+fMBw/9Nx5LIs/5QdtlTQw2mhaKIsaKKeGFgYye/UEQ==
X-Received: by 2002:a92:4906:: with SMTP id w6mr8315037ila.234.1610029209455;
        Thu, 07 Jan 2021 06:20:09 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id e19sm3426583ioh.15.2021.01.07.06.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 06:20:08 -0800 (PST)
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [BUG b4] b4 can't import message with '$' in message-id
Message-ID: <1dd0249a-d3bd-dd43-f4f4-f59a6a096c7e@gmail.com>
Date: Thu, 7 Jan 2021 09:20:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit

Hi Konstantin,

It seems b4 0.6.2 can't import a message for which the message-id contains '$':

$ b4 mbox -o- https://lore.kernel.org/git/002601d6e480$c193bd00$44bb3700$@nexbridge.com/
Looking up https://lore.kernel.org/r/https%3A%2F%2Flore.kernel.org%2Fgit%2F002601d6e4804bb3700nexbridge.com%2F
That message-id is not known.

$ b4 mbox -o- 002601d6e480$c193bd00$44bb3700$@nexbridge.com
Looking up https://lore.kernel.org/r/002601d6e4804bb3700nexbridge.com
That message-id is not known.

It seems the part between and including the dollar signs are removed.

Cheers,

Philippe.
