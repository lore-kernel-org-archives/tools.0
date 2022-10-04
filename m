Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6828E3
	for <tools@linux.kernel.org>; Tue,  4 Oct 2022 10:08:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id f11so17893835wrm.6
        for <tools@linux.kernel.org>; Tue, 04 Oct 2022 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NJgZbZcBfPBapb66ssCkPR5VzbBGgBOyfOB14Eozpjs=;
        b=h6EakCMI1Fzn7RlVMlnv3k+ljR8fEKjvC7C3pyza6R1tetInz4eZw6xlQe0r5hx2+3
         S9WX/8quPMvgwMZWqH/GFikGDKkdSLU/vVuue9tHcmL/jDH9OMU5WgtmeZRwOQx/LtzQ
         XQWzuHOsZpCOHyzQkIHPO53fvVOJKUCyKDZ4SpKxP2d6flgu/JNgSzz0SkZGJjI/FDVK
         X0aV70rSRQH6TF6Lvkj0DsubxdB3v+SQySXK9V7NjW3zFAVae8cF9A/MFsmwVESFb1kF
         neSuaU9zzTpXNGxOE06kIoDYbB4M89HBLIOlmlhK1vdg1ij6yAhF4IbJF+bPCYRi6azg
         UyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NJgZbZcBfPBapb66ssCkPR5VzbBGgBOyfOB14Eozpjs=;
        b=ISrY45QcSVumBdsghwJ27NgDlvdy1R7TcrWCE6cTBcrshm48xtxk6QijpmNhI+h2dQ
         34MAjiFOq/zVIEzVOh78Io5S5zF7y+d7Kn7ihYn2RjM75BsrahS4OTGrCzJo6g+qv/gI
         PoHL7UrHl9WhOYlcnCMw3GgNWSh75bsrs504cQIr7p9+jjsWuRHIrXqlNL7AmaDq1fUt
         lhXOO1fo7LXXp6COWmW3c8/C5aI7MjK+IhOpBgrfAHHSYSPnypAW8+M/9LaOZB1hEzs+
         0umsokPT1ne6OeEWc71mccYZgX2eztWCmtPlfjW+1sAp4qIGXI0mBeuXKROPVFRuxUbd
         qOrg==
X-Gm-Message-State: ACrzQf1Sbn470x3FgEJQms9XZPZsbtepnvlvtduvMmWgWCjDtWylep91
	QjUzUwU1ZFkYK06NC1jI7So/TgZUbsiNtA==
X-Google-Smtp-Source: AMsMyM73CV0pz5myXNwINO6C3iwLIzYwe4l3WPW258OzvXuwpjQRNJ1s8lWh3o6UID+eE8wtHkL0kw==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id e35-20020a5d5963000000b0022a47edf98fmr15387075wri.155.1664878118156;
        Tue, 04 Oct 2022 03:08:38 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id l2-20020a1c7902000000b003b33943ce5esm20561464wme.32.2022.10.04.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 03:08:37 -0700 (PDT)
Message-ID: <01b74898-c1b0-3837-26e5-193339b74267@baylibre.com>
Date: Tue, 4 Oct 2022 12:08:36 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: b4 cover-letter in single patch submission
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
 <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
 <5eb13320-bbc6-42ff-9161-24b789292098@baylibre.com>
In-Reply-To: <5eb13320-bbc6-42ff-9161-24b789292098@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konstantin,

I have tried v0.10.1, cover letter is no longer sent when dealing with a 
single patch,

thank you for the fix. However, the cover letter is instead embedded 
into the

"under-the-cut" portion of the patch, this means the user still has to 
unnecessary

fill the cover letter ; because keeping the cover template as-is will 
result into "b4 send"

failing. My suggestion is not include the cover's title and description 
into the patch,

I think keeping only "base-commit" and "change-id" is enough.

Regards,

Amjad

On 9/27/22 11:34, Amjad Ouled-Ameur wrote:
> Hi Konstantin,
>
> On 9/22/22 20:01, Konstantin Ryabitsev wrote:
>> On Wed, Sep 21, 2022 at 02:23:18PM +0200, Amjad Ouled-Ameur wrote:
>>> Hi,
>>>
>>> I would like to open a discussion regarding b4 tool. I read in the 
>>> b4 doc
>>> that it will always include a cover-letter even when sending a 
>>> single patch
>>> [0]. This is regarded as a proactive feature in case the submitter 
>>> is later
>>> asked to split up the single the patch to many patches.
>>>
>>> However, this can upset maintainers and reviewers when a single 
>>> patch (that
>>> does not need to be split up) is sent with a cover letter that would
>>> probably contain the same title and text as the single patch.
>>>
>>> My humble opinion is, adding a cover letter to a single patch should 
>>> be an
>>> optional feature.
>>>
>>> In this case, it might even be convenient to keep the change-id and
>>> changelog in the patch's comment section.
>> I agree, I never really liked forcing the cover letter on a single-patch
>> series. I've committed the initial implementation of mixing in the 
>> contents of
>> the cover letter into the patch basement itself. The implementation 
>> is not as
>> clean as I would have hoped it to be, but it seems to do the right 
>> thing in
>> most of my tests.
>>
>> Please try it out and see if that's more like something you were 
>> thinking.
>>
>> I'll backport it to 0.10.y as well.
>
> Thank you for taking this into consideration, looking forward to using 
> v0.10.1 :)
>
> Regards,
>
> Amjad
>
>>
>> -Konstantin
