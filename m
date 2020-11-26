Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by mx.groups.io with SMTP id smtpd.web09.5718.1606400818760784777
 for <tools@linux.kernel.org>;
 Thu, 26 Nov 2020 06:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zx2c4.com header.s=mail header.b=I8v0G9AY;
 spf=pass (domain: zx2c4.com, ip: 192.95.5.64, mailfrom: jason@zx2c4.com)
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38812cb3;
	Thu, 26 Nov 2020 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:references:in-reply-to:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=6nLBEU6+dj8ET62jb2iRzssc8FE=; b=I8v0G9
	AYg7i61SAJRd8fF14USMq3JswZ6jo6DFksFHeOh2oShoJt8i7JZTGFJ1x4k10fQx
	Qh1EDdJpRZoVKGklfPBMz7IRVfgh7xywlyBIYLlIINa8GS40R4D1HvFOLDnQ8RDa
	Lu+4don0FqcYX6l1HCEVBmc5iL59jTO93l2yFOESkILjXTfsR3/hujdo0h/M9phj
	1WutimK8nfAnVZ9jvuyXP97D82eHFBiXw1MbQMP3HeWBUgd86uMksEIl11XgYuSs
	xdqaarzmkoew2IgbduUZPH7fojWJ5BF/ZWr7NbMV5DYaCcUOZt2TU9RiCfqFb1JU
	T9r5MsCoGDDGfJsw==
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id acfe54e0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 26 Nov 2020 14:21:56 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id g15so1801228ybq.6;
        Thu, 26 Nov 2020 06:26:57 -0800 (PST)
X-Gm-Message-State: AOAM530q5RHHsDXv4WLw57v9lEFRRhHriVpp1fZ3HS7VaVQX2ByqDdMm
	fHsmO+2yslq/GkJymOpZJotxhVJ+t3eJfh/1T7k=
X-Google-Smtp-Source: ABdhPJxO7anLRpr+E7vnegbHbN34gRwwtLzd/t2q2WgKAx9TuQAVY57vyQMjOeCbeqxqXI94XwCjefssHRBJMVyVOvM=
X-Received: by 2002:a25:d215:: with SMTP id j21mr3690692ybg.279.1606400816549;
 Thu, 26 Nov 2020 06:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
In-Reply-To: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Nov 2020 15:26:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9p_GDbDzspRud7yDpB7tj2PLXuDG5+eAmELe0Qv_Zy5cw@mail.gmail.com>
Message-ID: <CAHmME9p_GDbDzspRud7yDpB7tj2PLXuDG5+eAmELe0Qv_Zy5cw@mail.gmail.com>
Subject: Re: [kernel.org users] [b4] version 0.5.3 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bumped in Gentoo:
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=9f277db57a7359480c6c1c7e7ab0e27daeafedd8
