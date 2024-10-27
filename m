Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A509286A1
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 19:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730058667; cv=none; b=J3QExIOlK122grOujXsmZ/vawe/CRnA8q2S07FQTRCQtyIxOoSAijzwt6mVZtwF2FEiNdz+j+bZpVI/KHfWcXKb/FiO7c7g29skJz+IwcuuGkFfMZPeOlnbWc+HhrCTgop9hwrJJnzilqRI4BdQtUfLa7R2KcRQ6jamB3KK0uA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730058667; c=relaxed/simple;
	bh=LUiWXFOt0y501LnYr125vVNUCx6SnwYs5rkL7JzYMl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oz1rrHE0VgwNIJN5E2w41CzUwzblqGw1dHRFFie5Veg6V7nMXfhHothYICGcODRkukqlfnJ08jSjRBrzidzF/s+whUVxEUpigkIKlRfaG7DrvVrZnvkCKJQEN37q1MCOpGdHJ0TzhxEbjx3vrRMj5Rots7JsHDyH2xQczC/iRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCMYX42U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCMYX42U"
Received: by smtp.kernel.org (Postfix)
	id 2CEF7C4CEC7; Sun, 27 Oct 2024 19:51:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15635C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 19:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15635C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c8c50fdd9so28553795ad.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 12:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730058665; x=1730663465; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jjRloCrY9TYxtEf+wMs+nkCfL3BnvHGL7onfI1HP2cU=;
        b=kCMYX42Uzyt7iyMz7ccy0KANK9ytTtFEMOd/jfV2x8wrqW9hgdL8jKT17KOCSdaklI
         pwjEIUU8JeFyCGZ8mB5HE/6v9AflVGoPI1PG0tRuGJLYUohGtzM7JK0ue50RBcJBWqLC
         dRC8Pu+5BFv8mSgbIr0yNQv1t7f8J2RcDq4R8LTquLtGSHOd+dZkqS+6I3YjBBZBPPiG
         gM5OQFuLTdgWQJSMEb1B3iTAya4iBJxejgBDBxikuzJt3OjTYsnlqPJKrJyQaC8D14eL
         iWz/pXJYeucmPHRe1wkftpHl9DMbblTPLIMXkP6dTl5ExqVrSUJfxQpECzUxEpFhm4fn
         EINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058665; x=1730663465;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjRloCrY9TYxtEf+wMs+nkCfL3BnvHGL7onfI1HP2cU=;
        b=fy/inugrMkiKerolIBARsZMsAL9Dn26K/d++LviXokkaAMSdW1cPLRVHDM9ki7mF+2
         xp3lrkWunZ3t1uYPtiUJrfYtnV2DcUur2AFRk8apK3cTPEAOLaeGUBG1/g8kl7CfpNuW
         aaLbMl+IRIfqZ5EUoNIZLMzkvSpv0Fb8OcsrSU//6KYVgyqpmA6Xs9+htNBXBySHJybm
         bFAyWVGeU0CnWuxRLp87z3S0OuqBI+0kix1U+Ushu2YJJ1xIpwPKjwtFhlNvstmW9++Z
         ppm10JqkDVn9x/ECBPl221efJGRKb5moEp2/WCFRAoOKPSYXoTn7QAtkBnKky7vlC6mK
         xpZQ==
X-Gm-Message-State: AOJu0YxpRVfVMC5k9wjm7FXmivBv2xv6JKp0j8rO3CWY6c7u5HPknfLw
	hgVrRoHQ6f/HPrNcmR/lGTTWOEjejCXmiC4S3eB/j1NZSPGZ3f+a
X-Google-Smtp-Source: AGHT+IFYp0qebEUC7ikKeTYJ11Z2rO/cCryFTpUuFj7bUFJWFW5OvXWAxcWyaz+mB9oL8xrRho4YUw==
X-Received: by 2002:a17:902:f64b:b0:20c:5a7b:dcb3 with SMTP id d9443c01a7336-20fb8aba792mr131452975ad.30.1730058664902;
        Sun, 27 Oct 2024 12:51:04 -0700 (PDT)
Received: from ?IPV6:2408:8252:400:cb00:ac9a:8453:685e:8eaa? ([2408:8252:400:cb00:ac9a:8453:685e:8eaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4435asm39004205ad.55.2024.10.27.12.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 12:51:04 -0700 (PDT)
Sender: Ziyuan Li <liziyuan0720@gmail.com>
Message-ID: <629e0afe-43e4-4134-865d-81e909e8276e@gmail.com>
Date: Mon, 28 Oct 2024 03:51:01 +0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing `Signed-off-by` line in patch email
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>,
 Yao Zi <ziyao@disroot.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <CAANcMPn=CYhCUAOAooGAKXXSYyOpxpj6dEAssUtQ7Zd9PY0BqQ@mail.gmail.com>
 <20241021-cream-grasshopper-from-betelgeuse-db60fd@lemur>
Content-Language: en-US
From: Cryolitia PukNgae <Cryolitia@gmail.com>
Autocrypt: addr=Cryolitia@gmail.com; keydata=
 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
In-Reply-To: <20241021-cream-grasshopper-from-betelgeuse-db60fd@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

在 2024/10/22 04:14, Konstantin Ryabitsev 写道:
> On Sat, Oct 19, 2024 at 01:43:01PM +0800, Cryolitia PukNgae wrote:
>> I am a newbie recently using b4 to contribute to kernel.
>>
>> Several months ago, I sent a patch with the wrong format.^1
>>
>> I forgot to sign off my commit, but when I run `b4 prep --check` , it
>> didn't warn me about it.
> 
> Interesting. If I run checkpatch without --mailback, it reports the error:
> 
>      $ git --no-pager show --format=email --full-index --binary --patch-with-stat \
>          --encoding=utf-8 97fee61300b9c3eb200f9d1f180966acaa288f82 \
>          | ./scripts/checkpatch.pl --terse --no-summary --strict --showfile
>      Documentation/hwmon/oxp-sensors.rst:58: ERROR: Missing Signed-off-by: line(s)
> 
> However, if I add --mailback, the error is gone. This doesn't make sense to
> me, but I'll raise this with checkpatch maintainers.

Thanks, plz cc me :)

>> I used `b4 send` to send this patch to maillist, b4 appended the
>> "Signed-off-by" line below the wrong divider.
>>
>> My origin branch is on Github.^2
>>
>> 1. https://lore.kernel.org/lkml/20240726-typo-v1-1-3ca3f07f93e9@gmail.com/
>> 2. https://github.com/Cryolitia-Forks/linux/tree/b4/typo
> 
> Thank you for the report. I'll see if we can handle this situation more
> properly. For my record, this is what is happening:
> 
> 1. There is only one commit, and it is missing the S-o-b.
> 2. The cover letter has the standard S-o-b.
> 3. When we "mix-in" the cover letter under the "---" divider, the S-o-b
>     trailer from the cover letter is added under the divider.
> 
> My preferred solution would be: when mixing in cover letter content, move all
> trailers from the cover letter into the first patch.

Sounds good to me.

Thanks,
Cryolitia
