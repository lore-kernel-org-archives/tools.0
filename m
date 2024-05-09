Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFE215278D
	for <tools@linux.kernel.org>; Thu,  9 May 2024 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262232; cv=none; b=Ad17O6fj7tkPj39YcPXQflGLGlXSC5FH6OaVgy0SLWZnzScgzz39gPgQ+fKO4v38EbvOH1Pcw2P09CRpn8QPMmgBhtIbWu0ZfA55SjTp3tWgU/EFYbZbUU0tuPmKAoTLaiQkykiSpW0KrMEgiMu2AEeRT3SKje3GK1pEyWlbFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262232; c=relaxed/simple;
	bh=k2ynwkcwyeqsGVIKzQHU4d41P21vjFtGsBmigvnXXCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuP056uhXc31LC0wPprB07/TxOqDs8/mC5AAgXFNmDpZpQTgoLabnmQ2skHQQjndMdKuQSFh1VgKyBeb3CoMBOM2/EosW6q9TtESHDYjTGHjY8LRhOR8ZWmOaeA9ThkzzqswqwoBVnZ03093YOG30dTk/IBn0Hy6+4IPKZcCdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=g2eVXXyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="g2eVXXyw"
Received: by smtp.kernel.org (Postfix)
	id DEDDEC4AF07; Thu,  9 May 2024 13:43:51 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2CD9C2BD11
	for <tools@kernel.org>; Thu,  9 May 2024 13:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2CD9C2BD11
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59c448b44aso219709266b.2
        for <tools@kernel.org>; Thu, 09 May 2024 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715262229; x=1715867029; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2rG5MaGNH5OmEY1nDMsK4d5sU01BazdjiG8dPYGooZc=;
        b=g2eVXXywtca5Xqmah/emGjMYg5xCSjJtVJ2WETRGQU7NgFhYILvLdWJxBeQ/ufcfGT
         qkqyaVKiHXqnfbhGnNCMGxynFsjjtuOivCRMhZ63+UtQCkHmuZWK9XH57acdhrYqlipr
         gGsV2/Hnq8KfStlbZJLmczrWLoosJ33gVCgyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715262229; x=1715867029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rG5MaGNH5OmEY1nDMsK4d5sU01BazdjiG8dPYGooZc=;
        b=oHGgZk05V6gTAU8PZz3Bd7ZiaCUG3YcT6an2rGFm5D6A7x/n7hAce1sJ4/v7fkV/tK
         5cW0k9IJhB39cULR1X82V1i2NojdZMTfA8WMHCULBD0wA9MYbUiT8hZY8hK6QUYsDUbw
         +DEsAuesJJTldrZXd7wGSEoaCJTob0+B7MdHO5VOyr/flWcf5S1XYGCNrOlMDwTTb22G
         4HQM349OvQrYXhn1fZpv7t7tCvbPjx9pDngCUaWKi6h7t1SdQbUx/pOrcx7SIePn9zX2
         vXUPxlSZMQr8jhMv3rf3YUMh0bAgck5DrfhTmMenDsr/UIR96qdASM8xE6DlrqsU0p+h
         9GSA==
X-Gm-Message-State: AOJu0YxRsXmcOAW/DZu0V2D+J0uLEF8HqC5DEEJuV03r1nIsVCqyxehu
	ArnJ4S9Kis3Vn3a00/VwskvIYg3QCXdwQXfubAOvhnz62R7Xf9Xsak9lX92M1rZrLRSL+JIw8ES
	m
X-Google-Smtp-Source: AGHT+IFMpiwlBvMRPp6YT4YCXiW1npf0b1IzbHqXZXJnhhdpSm8u8AVrjqqVnoC8novl6K9afsZ0Fw==
X-Received: by 2002:a17:906:22c7:b0:a59:a977:a15b with SMTP id a640c23a62f3a-a59fb9e73b4mr351424466b.68.1715262229169;
        Thu, 09 May 2024 06:43:49 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b1773esm74789066b.199.2024.05.09.06.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 06:43:48 -0700 (PDT)
Message-ID: <65ab295c-e613-4367-a4a1-2cd04581fd29@citrix.com>
Date: Thu, 9 May 2024 14:43:48 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 shazam not stripping ---
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
 <20240509-victorious-lean-mamba-4e77b7@lemur>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240509-victorious-lean-mamba-4e77b7@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2024 2:40 pm, Konstantin Ryabitsev wrote:
> On Thu, May 09, 2024 at 01:05:40AM GMT, Andrew Cooper wrote:
>> Hello,
>>
>> b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com
>>
>> is leaving the notes under --- in the commit message of the finalised patch.
> We aren't doing anything beyond passing everything to "git am", so if 
> this is happening, it's not really something b4 is not doing correctly.
>
> I can't test your example above, unfortunately, because I don't know 
> against which tree this patch is (I've tried xen tip, but that's not 
> it).
>
> Can you let me know what repo I need to fetch to be able to apply that 
> patch?

It is xen tip, as long as you've pulled up master within the past 2
weeks.  I happened to be testing on top of a2330b51df2.

But if its git-am going wrong, then probably the only option is to keep
vigilance for it happening.

~Andrew
