Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.3076.1606384717752291023
 for <tools@linux.kernel.org>;
 Thu, 26 Nov 2020 01:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: jirislaby@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id v22so1602523edt.9;
        Thu, 26 Nov 2020 01:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RN8VWreTaaRT4hOUa/h24d0awQi7xcY1SY0nyc0xQIU=;
        b=BQSkHQCjECAc9HCAYMyw5pAQS8dHurOuS7EkHZHd3rmiYpLluZevLsY8zHJNg1d2Mr
         DTNP4fXVog4ZIWH/8R5ADsW84+uEuWNEo/4yS6GiRzIntBAfK291XzFbMf+Xx6cBoz+3
         5mmO+cyA5a2+1m0nReNZvIZsjXNmDvUPQbhLdiDWZGl7r0PMzhG8MqSklHubpkgzP2uW
         qLdmfwmB+p9KtJvnHSsahjt5bFX4oh/OKIY9zuqYJeM5aGTlCPhu5fheSnGH/+Q1qxEE
         jsEIAyTHNHtA5JMKfsrxodwdbG/lDKYS59FF9EQWzCdf/Vs1kc+jTBgxh4VvZ33Eldw7
         MKHA==
X-Gm-Message-State: AOAM530g2/LXkAM6pvZYweu3pujmUg+nSG/LjzVHLTDwnRKX7rMLhgKx
	PPJBf38E0VmxOjWkNWBjKcw2/IKi644=
X-Google-Smtp-Source: ABdhPJzgaJ6wAEFdJ4PI+OZda/agKt1rHw7QD5w1bFWiM4DWNE0FVf47jW0130seE9J/1PsSuMXCTw==
X-Received: by 2002:a05:6402:1844:: with SMTP id v4mr1687215edy.346.1606384716063;
        Thu, 26 Nov 2020 01:58:36 -0800 (PST)
Return-Path: <jirislaby@gmail.com>
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id d23sm2850039edp.36.2020.11.26.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 01:58:34 -0800 (PST)
Subject: Re: [kernel.org users] [b4] version 0.5.3 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, users@linux.kernel.org
References: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
From: "Jiri Slaby" <jirislaby@kernel.org>
Message-ID: <98da4f38-84e4-558b-ab57-a4a15a0f8687@kernel.org>
Date: Thu, 26 Nov 2020 10:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25. 11. 20, 23:15, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I've released b4 version 0.5.3, which offers a handful of bugfixes and
> small enhancements in the stable-0.5.y branch. This is expected to be
> the last release in the 0.5.x series.

Hi, did you forget to push the branch? The tag, I can see. It's one 
commit on the top of stable-0.5.y.

thanks,
-- 
js
