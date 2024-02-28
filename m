Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D284D11F
	for <tools@linux.kernel.org>; Wed, 28 Feb 2024 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709153199; cv=none; b=TBJyniH298mRjf0ek2EBTVaV0TI44xjhLVTFUf8OnXsO/YQQdHGa80AwG5Yhh8fsXg4US5hSapW3pOj3xnrgiHtdRAu46NkMynusQEFkV1H/hxJcR73v5cXrvWsdxeLq9sm5AxUoxXh/IGv6rSqli6y8xNeJhMntI4z/J/483gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709153199; c=relaxed/simple;
	bh=zeInfVJrEO63s3vNEguiGABOY35s3HM6yuXnyNGFJ0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJBN5dZDiR+1p0gNw78xH6HzaAIBu97a9RqStHZKWoQw+F1u7SK6NXjk3+A8g1605/n/JLg4yq+zhP8bKPFBa85zLmP6lHao1GFiISdEjAlgS8UZ7uR5Tu6klcHEGVzqa40+ifdm3qcdrKZkYnPpKp5C7fCSMk/+2Ud82jtmE3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UOoakNYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UOoakNYT"
Received: by smtp.kernel.org (Postfix)
	id 8F96DC433F1; Wed, 28 Feb 2024 20:46:38 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76BCBC433C7
	for <tools@kernel.org>; Wed, 28 Feb 2024 20:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76BCBC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bf3283c18dso1151239f.0
        for <tools@kernel.org>; Wed, 28 Feb 2024 12:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709153196; x=1709757996; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6FNyEsvJVHeYfZWtn4fHH/WvdRQ34fwWdjZTn2veEVU=;
        b=UOoakNYT2ppzVoCzf6BKRcdyqv3f2zs9MQEQehLMdWToHZGLIoPIpHk9Z7xwceh0Ij
         f4SjNSsQ/4nr6+2n449HGQ1aP7C7vQNGB6Pea971sGkAToc4gWjb7KMCmh/uu54hZMpQ
         MRZxnRchE4wv93VZpX12rtrfZrBCpXQ4D1nVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709153196; x=1709757996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FNyEsvJVHeYfZWtn4fHH/WvdRQ34fwWdjZTn2veEVU=;
        b=XsRo5tzP6s6d+RTtt87WbimCkB85SsEiMsaviwAhu/SHIycmPCMktCG5wdQdOiE2Bq
         3in5GfDoQNeeSBxh7DRcPcjeFCPqtQJGA10vniZUxK2XYgXykNFtw+zsPXKYXXK0Gypw
         KQ0wkkEUjBFpYvD9IrHsAFqTuJ5NvIxugZMOaaSCv6qRobZdlqBCEL+0d91zIFOHyHKh
         9IISnWuVpLcGayNq+eL2rlo4ia9HI6608oY2liS3hZk/5euaWKS7i87Ay3qAZN6+MRzn
         rjEJ3Vq+Npf75Neasg2EjauaRhWJ3X3i/TnTSjBFlWbBKalKHQtQNzrUrCErOsb85ugE
         B6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTLxOr156f2P2WdSLz3lKTAr2qjMrhlwwDfPlEXWd3xe4YqMTQ1khjSg51iyt9bFCV+iUr7imcJ1cUbDNXF/f/
X-Gm-Message-State: AOJu0Yws/qSgKTRC70U+jpE625G5MQeucxuWBVjxnVtxOryY5F4MxM2P
	FFbTjCo1/BdDBA00WcRER4WaZwRmxtqyGd9xhoX+Kjo2vSEjO7DQBcXtwVDABeI=
X-Google-Smtp-Source: AGHT+IHq0jnKtavjBlP7cqqeIx0XWkFAdXjnwHIEy1c4bRepMG0fuN/Ay/QUnZjuXHZSW846mqOJ4w==
X-Received: by 2002:a6b:580f:0:b0:7c7:99f8:2893 with SMTP id m15-20020a6b580f000000b007c799f82893mr240817iob.2.1709153196492;
        Wed, 28 Feb 2024 12:46:36 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id v8-20020a02cba8000000b004747cb8b342sm33369jap.15.2024.02.28.12.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 12:46:36 -0800 (PST)
Message-ID: <e2c3dcf5-8d13-4694-bf1f-129ba473cab2@linuxfoundation.org>
Date: Wed, 28 Feb 2024 13:46:35 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Content-Language: en-US
To: Linus Torvalds <torvalds@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 17:43, Linus Torvalds wrote:
> On Tue, 27 Feb 2024 at 14:32, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
>>
>> So, the question is -- is this useful at all?
> 
> I find the demo intriguing. Useful? Who knows, but the potential is
> certainly there.
> 
> The summary didn't seem to take Rafael's last (fairly strongly
> negative) email into account as much as maybe it should have been (my
> first reaction was that maybe Rafael's last email hadn't made it into
> the summary, but going back to it I think it was there, just not
> nearly as forcefully as Rafael's email read to me).
> 
> I personally would find it more intriguing still if it actually
> reacted to the code instead of just the discussion, but I suspect
> that's still some way away.
> 
> IOW - interesting. But hard to tell how useful and how maintainers
> would actually end up using it.
> 
> Would it be something where when you bring a new developer into a long
> discussion, you'd introduce him with a summary of what has gone
> before?  I'm not sure what the use cases would be in practice.
> 

Konstantin,

As I was watching the demo, the same thought popped into my head that
this could be useful to a new developer. I am starting a mentoring
session on March 1st with 34 new developers.

Probably something we could experiment with to see if this helps them?

thanks,
-- Shuah


