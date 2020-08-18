Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.70377.1597769205465802260
 for <tools@linux.kernel.org>;
 Tue, 18 Aug 2020 09:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=Io5QTXCD;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.222.193, mailfrom: josef@toxicpanda.com)
Received: by mail-qk1-f193.google.com with SMTP id i20so4641469qkk.8
        for <tools@linux.kernel.org>; Tue, 18 Aug 2020 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KeZ3wejlVj94+XmNfztclRP8VIjndEDQtkIfdxsREAY=;
        b=Io5QTXCDw7m6At4XHusj8iw4pR9UpTHUgKx6ce6VCZzKdVEybrdZaw9jtL0cDpx6SJ
         7BueFlVWjqAQez2c6ynPA8RrWduYlPiYEmory7PI3CGAO+K6KeOe8el7Tt80SdK893+Q
         r4jkx5cJd5CEvAjoWfCyUe8VtbehlIbxpzszNRuj4gqvZzkISc5NTPuIjCruw4WeBxAr
         b1EuMXBpIA2Pn6yEMV1T6RvKvk5E7dUHHcEMMPJzmh+N41S8vFv9lbNz7nYvtRAo2QQh
         vjxMlkm7/9jPMnv8RLnTiuGYFSJWgGjUGENgOme1miv7cS1fy6TlMwb+/PW114jb6PA+
         oVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KeZ3wejlVj94+XmNfztclRP8VIjndEDQtkIfdxsREAY=;
        b=dZaz1tj8VCjlWMF32ygYx/vMOG7BxbK90gyRL9NFWasFxuUl7QeLjVtjscvoaNPAla
         /4lSGlAOK3KJjDCiDnWPO2hylHZ+R49rZa0IL9B6D+I0wFtba9iGfrW4Z/nOK71oREp4
         Ue4fCvAWEwapdUEeEnbgffHb6xVVR7eVlpiAcaNnkR16lJMR6t1ZoH0sykIv7eBjwkVU
         4+vIXCwECN9JYbkYOtCvyx8rjBIRaefRPQiraZXHbMnmilhUGPwY4hH7ql2i1MiJILT9
         kK0JAnL8mmN6iShWsB1EiRI9I9JBMp0vZ6jxntbzv8UWVVUeDda2rIntyKNmUP6q/Ose
         pCGw==
X-Gm-Message-State: AOAM532+7A37vzuMG9SksXrwltrHKPPmjE1+Kfj5Ydk5yRps7387x7Uv
	4bfTA7dISVB0smpsx+zESR0Q5k2e2w3xy54a
X-Google-Smtp-Source: ABdhPJzaQmfiLztQY9OuoqcsSOsCt/7UPewzT3gWLCdHsghOxdbg/rYhif5/NT991FGnCWgqwfh1GQ==
X-Received: by 2002:a05:620a:1645:: with SMTP id c5mr17852331qko.309.1597769204224;
        Tue, 18 Aug 2020 09:46:44 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from ?IPv6:2620:10d:c0a8:11d9::1055? ([2620:10d:c091:480::1:7359])
        by smtp.gmail.com with ESMTPSA id n4sm23297482qtr.73.2020.08.18.09.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 09:46:43 -0700 (PDT)
Subject: Re: [tools] Problem with b4 with v2's in the thread
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <72f0dace-2283-b905-5ef3-ad623f34e79b@toxicpanda.com>
 <20200818151601.ewj4spibjbwz7l55@chatter.i7.local>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <2ef682ac-85e6-a4d0-d709-3ea2b398ca16@toxicpanda.com>
Date: Tue, 18 Aug 2020 12:46:42 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818151601.ewj4spibjbwz7l55@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/18/20 11:16 AM, Konstantin Ryabitsev wrote:
> On Tue, Aug 18, 2020 at 11:01:23AM -0400, Josef Bacik wrote:
>> Hello,
>>
>> I have a thread here
>>
>> https://lore.kernel.org/linux-btrfs/941273be-4250-3406-79e4-60ef762c5506@suse.com/T/#m64fdf99cfbdb8914a7f665a1d241f6643a8be389
>>
>> That doesn't work right with b4 am, it's only pulling down
>>
>> [PATCH v2] btrfs: Switch seed device to list api
>>
>> Which is just v2 of the 5th patch in the series.  There's actually 2 v2's in
>> this list to address the kbuild fixes, but it doesn't even pick up both
>> v2's, just the last one.  I realize this is a weird case, but thought I'd
>> report it anyway.  Thanks,
> 
> Right, this is not really a case we can reasonably handle without making
> too many assumptions (that could be erroneous). A similar case was
> discussed on the users list a while back and the consensus was that, to
> make maintainers' lives easier, the entire series needs to be rerolled
> and resubmitted, instead of individual patches in the thread.
> 
> So, I suggest you respond to Nikolay with "looks good, but please reroll
> the whole series."
> 
> The alternative is that you can download the entire thread using "b4
> mbox" and manually edit subjects to make the proper v2 series that b4 is
> able to process.
> 

That's fair, thanks!

Josef
