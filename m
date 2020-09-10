Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.23571.1599748429927803942
 for <tools@linux.kernel.org>;
 Thu, 10 Sep 2020 07:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=nAG7HqO9;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.160.194, mailfrom: josef@toxicpanda.com)
Received: by mail-qt1-f194.google.com with SMTP id c18so4993874qtw.5
        for <tools@linux.kernel.org>; Thu, 10 Sep 2020 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1iCqoLwaDLooVwTR3E/eS9ylRkRnrvmr7epPV7tv050=;
        b=nAG7HqO9SmkM8/PqwCbMJkYaZBU0q/47AWdHtrHQO6SoZYkHjJjBdg2a668lJl7bkI
         GWWtrgsHYzc92gwer/5jY/tFRi206Il5u8r6W1FxRPlNsTWm5UHC9xnES0h9LLX0UUwV
         mlnDwzvX5xjJevtUf/TluT4miNbN45z18PnWlgvYsuuVMitFVZPNd9L/tMvh7By6gF4M
         w1Ubu40VNmptQKn7clzTFfzxcQQWqDskU54vnJZ0ou71FeSGwGqDxL6OFlrA0T7/dCI7
         Cporxwj9H5Ic69RInswpR1oqzazHM6M9gMD6D8rfeyLod9p1YBzJtiSse9IxoTd6eCqJ
         g36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1iCqoLwaDLooVwTR3E/eS9ylRkRnrvmr7epPV7tv050=;
        b=I7T8gSyqGt55OnZWcRUKUD/4w+Ykqk2jUVAh/wvM/N934mi+vAV5bAJXZ5CLz1Iicv
         Q3PmvuQ1aQTq0Zm5YozEELG63Leyqdk2oVLYypDQMSBSyEIF0ssOTgsoU/T+K5FWAmUJ
         nsauwul0KJ7nbMcwEq3IJ3XeGzayLkJivhYTB7NcXfSkQdXh3WAR3EwPWI5ruhssr9Kh
         IJnXzJ3Y4fPlDF2+husZhfLFniWmKBgc9MnZqWAbC2qmVHj5XQs6P1xQq/ugHjWSgjt/
         S15gwOr22fNDryrO4vQ/mIewhXmtbZkYvddp8KCf3gKLd2OxuA2fCDWQwH+6dSl+tGPC
         5kFQ==
X-Gm-Message-State: AOAM530cFM82VdYKtls9jD51o2gbtfsQnioaNzfW/KvR2NcU5voIV3TQ
	+Gm4oqNCJBw7X19l0smUKaC3qQ==
X-Google-Smtp-Source: ABdhPJy/DNyrohY9Vq7jXYvsVCQlY3XxOF30kWVwefEWL56ChgyYICrNXHEQhSK+04QKwDuZPC/10w==
X-Received: by 2002:ac8:1a7b:: with SMTP id q56mr8181016qtk.56.1599748429042;
        Thu, 10 Sep 2020 07:33:49 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id r64sm4992830qkf.119.2020.09.10.07.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 07:33:48 -0700 (PDT)
Subject: Re: [tools] [PATCH] b4: add an --apply option for b4 am
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
Cc: kernel-team@fb.com
References: <73e01862e01dc42fe853365e4babe1f9d8c2e839.1598283790.git.josef@toxicpanda.com>
 <20200909194527.ig2b4ayod7esd2a3@chatter.i7.local>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <f823853e-cc35-7ec3-cf16-fef95be60da6@toxicpanda.com>
Date: Thu, 10 Sep 2020 10:33:47 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909194527.ig2b4ayod7esd2a3@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/9/20 3:45 PM, Konstantin Ryabitsev wrote:
> On Mon, Aug 24, 2020 at 11:43:21AM -0400, Josef Bacik wrote:
>> I'm infinitely lazy and would rather not have to copy and paste the git
>> am command to run.  This patch adds a --apply/-a option to git am so
>> it'll go ahead and run git am so I can get to the work of reviewing a
>> patch series.
> 
> I've considered this many times, but I thus far prefer not to do it, as
> we generally try not to touch the developer's tree in order to avoid any
> potential badness.
> 
> The functionality you want can be easily achieved with "-o- | git am",
> so you can make sure to heed any error messages first without it, and
> then with it:
> 
> b4 am <msgid>
> (perform the review)
> b4 am <msgid> -s -l -o- | git am
> 
> Would you be willing to use that, or do you think we really need an
> --apply option?
> 

Yeah somehow I missed the "-o -" option, I'll just use that.  I primarily use b4 
for review, so I'm in a scratch branch specifically to apply+build+review the 
series I'm pulling, so I don't mind if b4 messes up my current git tree.  But 
this works just as well, thanks,

Josef
