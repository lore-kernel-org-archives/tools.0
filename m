Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE42560
	for <tools@linux.kernel.org>; Tue, 28 Mar 2023 12:15:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d17so11944582wrb.11
        for <tools@linux.kernel.org>; Tue, 28 Mar 2023 05:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1680005750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1GgnO0rQ9xhwRCVzD0jCpSGg+KgEyNO0HdsjHO5QF0=;
        b=ZcaLZbYL+iwJAA1z6QFlGP+TwizeMgMny1yrHEmoQOETv++o/Fec9BJwLxHkQ5fjZu
         R8SQvpI7MPiTV0/93doRpPM1g0r+wP3vjmU0+KoKcuNX10+7xuXLOJ1f5okODSQhJkZp
         81DbfacEBptU6s+ypF1iJjFvxi3KmLYxKULrtdZEm78SCnnA6EcpdB+kgT/rx+CSS3gd
         Bu4xt8xx9db+Z959Lxn52Dg1ogDIZ8qA+FAUACMZ/Jo41v3QbMEgu+cf4xMUqof0S7/3
         +N9ZyeL62hoKZr55uXRgXd03AsHqjYIxH6n/dgO/8oIskIFAl+2bsTTuks+WYqKGUIM7
         rUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680005750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1GgnO0rQ9xhwRCVzD0jCpSGg+KgEyNO0HdsjHO5QF0=;
        b=WGUJhdaXs6MYuuAuKvArwgenk3ZeQszCRWvxAVz4M0KECV2bAlua9vMHc90fAwukNf
         +iSi5WYhSzZJCa/uOrWx9iJiZ9/LaVOFjwtgL0aUr9QkRSWs5LVZ62g9eqCnpoNDuzh3
         bCvpF8q1npWH6KOLyImuoXtOOnOaBeW7+0IF92AZuG9wnQHZjWj6rzRCeGyym0s8DOjM
         dWFii6qzhmRrxGXAUKkelld+/H5MOOuctGASW9b3Y5kt8pFj1uRI3m4BA9fH5DwbgnaA
         mttJEiQ8NYnCTYnnTCfNBGag1RCWgNdSi5kI4vk2V8BtPCTJ84WZlC1ceFrs3GTFk8uG
         Gmig==
X-Gm-Message-State: AAQBX9c5evv6s7vzJQLjcqRNDRF96r2MGwyUP5rOoblHCSzgj2UCThcR
	Hoc55ypYFwVKEqCKA6c4x6vI6/+04ijYpxll0CA=
X-Google-Smtp-Source: AKy350bWz1QDVswJ7kFLoBb/OJ/wRBtluMmmqZ+xbr/Wab4jzNT0ztONiPtLUA/Bg8hPWINf6XsxTQ==
X-Received: by 2002:a5d:4688:0:b0:2c8:b9cb:885e with SMTP id u8-20020a5d4688000000b002c8b9cb885emr11336367wrq.24.1680005750406;
        Tue, 28 Mar 2023 05:15:50 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:a2f8:d6d4:26a:a611? ([2a02:578:8593:1200:a2f8:d6d4:26a:a611])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm27637816wru.83.2023.03.28.05.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 05:15:50 -0700 (PDT)
Message-ID: <19f8574c-d743-cd8e-4b61-cb93a02f844a@tessares.net>
Date: Tue, 28 Mar 2023 14:15:49 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: b4: send: support git notes per patch
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>, Christian Brauner <brauner@kernel.org>
References: <9a4ebcd9-9d23-f525-cedd-222970f1b207@tessares.net>
 <jx7vyqdj3qt2zwgsxh6hjac6osr52n2vcmkj2pg3elapcth62m@jtl27si2pa3g>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <jx7vyqdj3qt2zwgsxh6hjac6osr52n2vcmkj2pg3elapcth62m@jtl27si2pa3g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

Thank you for your reply!

On 27/03/2023 23:18, Konstantin Ryabitsev wrote:
> On Mon, Mar 27, 2023 at 12:20:43PM +0200, Matthieu Baerts wrote:
>> Do you think "b4 send" could attach the "git notes" to the different
>> patches being sent, similar to what "git format-patch --notes" does?
>>
>> Personally, I find this quite useful: when you have a series with a
>> bunch of patches, it seems interesting to put a detailed changelog per
>> patch instead of putting everything in the cover-letter. It makes even
>> more sense when some people are only Cc with a few patches and not with
>> the whole series. I didn't find a way to do that with b4.
>>
>> But then, I guess we might need a workaround implemented or shipped with
>> b4 to preserve the notes when git filter-repo is used, no?
> 
> Correct, I don't want to touch it until we stop blowing away git notes every
> time we run "b4 trailers".

It makes sense.

> BTW, another alternative to git notes it to add this info into the commit
> itself, e.g.:
> 
>     libfoo: update foo bar
> 
>     This updates foo bar.
> 
>     Signed-off-by: Dev E. Loper <dev@example.com>
> 
>     ---
> 
>     My notes about the patch here that will be preserved by "b4 send" and show
>     up in the patches sent out, but because they are below "---", they aren't
>     going to be part of the commit.

Ah yes, good idea, thank you!
I can use this technique if "git notes" are not supported.

>> PS: by chance if you can have a look at my patches/questions for 'b4
>> prep --fork-point', that would be nice :)
> 
> I know that it's been sitting for a while, and I'm not ignoring it, just need
> to find a good stretch of time to dedicate to understanding the RFC set.

Oh sorry, I just noticed there was an up to date and well maintained
patchwork project for b4[1]. I will stop bothering you now that I can
see patches have not been dropped by accident!

(in short, for this RFC, I just wanted to understand why there was this
complexity in the code to find the base-branch when --fork-point was
given in argument instead of simply using it if it is valid)

Cheers,
Matt

[1] https://patchwork.kernel.org/project/tools/list/
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
