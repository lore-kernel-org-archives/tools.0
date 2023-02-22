Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D715A0
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 02:12:30 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id b6so376933qtb.1
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 18:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEaVRt7qLDJitctO3ZQ4vie8AavWFoboRImPgruzdcQ=;
        b=iAygmBlP2cn9MWH0SKZxxcSWlsbgbhBFamIdQ556a6+krsL/Rd/7a7IfMijG5qEpMD
         +VedHVrZ8K0NWhNlR74fQA4Skn/weEtmUIylZKol43d4kuHcw4Cre497a9HBVFgs3qnT
         tNV9tv8qt/jIBMkV8pMZPmyXTTPSeUlrUcJ6zCJP1pUr/a/bGpIdSvrE02X92w04J/0+
         KvwdmBR1jCreA4W+8CQZUoY6oFF2vkeYlOuNrqL7aNz8b0ZawlzhdMvSq3be+EDxUdmR
         fSem3V92XcxfpWdD1FcafrtQ3cmzOPzD4nEJZF8oVQAfzvvSzNJI2ZzHdkvA14rbqU2a
         e/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEaVRt7qLDJitctO3ZQ4vie8AavWFoboRImPgruzdcQ=;
        b=7Gi2rv7As4NkLEibBtawfQBSTCYd/9kHtIOtw8WQvJTHwT0EnA1/3iEiAm5Ivx0DPx
         cJFPq2NC+XLQP1lLhFc+iA+XBW0Ver9X6GszT15GLa4NlpIwezAf0rkEtk1I+yABDrYH
         OdmgUGIwU5bL52sFm78VqVMbVCKZkA5gdzuMmgAaJtPqS8i4u06PJCpA8GopjQxJ3/pF
         TNClkSjc6F1ht0t4Zu2/fEF+VUwuYeijPzBCHFA+8jjXp0qhPzfyz7trhC5V+4qEE3vF
         RUAblZS3fno4oo99PCRTd3pQ9A8CTV8vljA7MQsYjnb3S4Dhao9ndCoAZ40kwnQ0X6Ra
         Us2g==
X-Gm-Message-State: AO0yUKXXyp+ZVX2sosT569WbST/Aq0QtI4wOV6vDETIaiEOBrNEYvBQE
	Ajirdn1/fCM+BTvkabTJOnrWe/R/EZRn9Q==
X-Google-Smtp-Source: AK7set+KxYyIJvx6DkHcwj8G0ZOQPCdj1CGd+TIDwGUaHiKrrGv7r8V8QX5f5G+d/r67ST23/da1bw==
X-Received: by 2002:ac8:578a:0:b0:3b9:cd2a:f13d with SMTP id v10-20020ac8578a000000b003b9cd2af13dmr26763746qta.59.1677031949137;
        Tue, 21 Feb 2023 18:12:29 -0800 (PST)
Received: from [192.168.1.128] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id a7-20020ac86107000000b003b6382f66b1sm1356726qtm.29.2023.02.21.18.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 18:12:28 -0800 (PST)
Subject: Re: b4 doesn't allow remote tracking branches
To: Tom Tromey <tom@tromey.com>, tools@linux.kernel.org
References: <87k00mdz3y.fsf@tromey.com>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <dc997085-026a-dbb8-d454-cff447b76f3e@gmail.com>
Date: Tue, 21 Feb 2023 21:12:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87k00mdz3y.fsf@tromey.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Tom,

Le 2023-02-12 à 22:26, Tom Tromey a écrit :
> I tried to do:
> 
>     b4 prep -e origin/master
> 
> ... but it gave me some error.
> Instead I had to do 'b4 prep -e master'.
> 
> Then, today, I forgot to checkout master + rebase before doing a 'b4
> send', so it sent some random patches from origin/master as part of my
> series.
> 
> I think it would be nice if b4 let me use a remote branch as the base
> for my branch.  'git rebase' has no issue with this.

I completely agree. In fact, I don't usually have a local 'master' branch 
(and when I do, it's usually not up to date). 

I sent a patch to support remote-tracking branches in 'b4 prep -e':
https://lore.kernel.org/tools/20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com/T/#u

Cheers,

Philippe.
