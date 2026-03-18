Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F343D75D5
	for <tools@linux.kernel.org>; Wed, 18 Mar 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841435; cv=none; b=VacXKF4AQROuCr6qZm7Gk0DQYoc4N9MK11wIvDkeFGNSjJRtHZmtIyVk6rjErBSZtbq0zmDo9FYQAZo5iP5LRkXRDqcxVjfo5/L02wd6XZQ9PVYXocgWr3tKsaE8O0/R+tkkKikUJts0avs1RzV7ojKe+5YVZBevfVkFXtGyOZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841435; c=relaxed/simple;
	bh=1CPHbVoGjmh154OUf3WiZt088SjTL3WxopmW4pbxn5s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=DQiGtjwQd584J6Ak2E8YqM5/yISRKRMAtoSOP2sl6EvZSP58soLw7mGTnsmzU0O7edCtHh3CmJqBmg1LJ4Uk+sneFMoDDwIx8cTThuoI/NNXV+BZJeoRnRWwGGbgraYj7pNKF+5jPf7ZOFHck9JUxvcy0GCaS2no5jQ9YLX4aS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 3A119C19424; Wed, 18 Mar 2026 13:43:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 832E1C19421
	for <tools@kernel.org>; Wed, 18 Mar 2026 13:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 832E1C19421
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso62732985e9.3
        for <tools@kernel.org>; Wed, 18 Mar 2026 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841433; x=1774446233;
        h=content-transfer-encoding:in-reply-to:references:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rJJ6ubKndD9mTljN++j15PLar8p3mrWIp3u6HpfPOc=;
        b=KqsRoxrMQBqVt6ILzkZ8mvpSXgmhZ9RFwHlspznzfqesfH5PrpD98foKxJAeEGoJ1N
         eDr7epJDA3pMDmBJMWfvfCIt2s8275zQfVFkvfggmGKAi7nSTg7ETGAP9zojcC2jFOsk
         ZpiF90BZc9D68y5voTHgDKfdIZXvH+0CnGTZy+8WaAjT/cJZrpVfuW28aWpyPLo9KU0A
         pPYpHznpJaEGfI8xypXfkOtQcsRhrsxxOK9lbQxMEcbUB6wPBoZJ9etmIAGKmOd3LOaT
         J5HAijV4DmynSXp9n0Nv3k0KD46ZJzR7Kko8Y2SVLdDErIOoskPTVv8vPa3XoAIsRNWT
         Hexg==
X-Forwarded-Encrypted: i=1; AJvYcCVGeZK6KgAFi8dgckdEfhY/KQriKPrKmOcxB7GvlQjNfgb1MftUI68rzejsWtPrwNHgIr9JOA==@kernel.org
X-Gm-Message-State: AOJu0YxoZpzpV+zg7vBAkKkXvDBqRw1/Gb6z0ks8uJIa06Ec4fzybGyj
	t8VNREtTMGOUQb4HL9b+mP1DSPyAomLS1sQIOjVCfzc8x2haaLVUw0Bw
X-Gm-Gg: ATEYQzzGwCDs2ROheAI/3/f4wcZXMYDscnTnjRZBjDw84pfk7I78I1Ops20GvYB4srx
	7Y/hWDovRh2eOC3WkHN+tP8mUbWdfn696WzEjizJPdrjPQpIIMDBmT0892XO604S34ZBuOx1CjG
	2kc8hkNeku+kSrTSRRcuWQ32hqClaW5NIFx0kbw1YOTprvThHRVpEoGPBflUgPRqaBxkLsGVN0k
	5D5+WmmXGJrUcSYmyBwi1bbSCyQNBgszkw+9M8CymtUh0wl3GRhGgmSs/7OKzWsCDBFApYD+Ja1
	ek8HqF4SpWFb518djvx6SvgY8oV/6JV4GeghTGIoFyA+P5emkNoLiKP5bZFji4xmS+0UVaRX8qV
	SsFznUtIMPagE9fDFkclV7dtnBsGnDLVWmPUpyKkg2xg1QF1PZrnSMq6YK2Mmeoh82Bd/3n1+cq
	+e8T4751vMpV+RsR1JWKVzYfd1awCJbSvbkH2g4LKNrYiAjZo8bHknB9PxFue0LE7Ele8Ye8brN
	79n8spcJahnwtEWnTOAc/9r69IbBJN6Ivka5wU9crEIrbo6YwMYrr6pvwiKdaE+1j70+IF7
X-Received: by 2002:a05:600c:638d:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486f441b9f2mr57815245e9.6.1773841432684;
        Wed, 18 Mar 2026 06:43:52 -0700 (PDT)
Received: from ?IPV6:2003:f6:f716:a600:896f:f743:959:55ac? (p200300f6f716a600896ff743095955ac.dip0.t-ipconnect.de. [2003:f6:f716:a600:896f:f743:959:55ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b74abdsm32381775e9.5.2026.03.18.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:43:52 -0700 (PDT)
Message-ID: <45b9f7a9-d5b2-45e8-bce2-863d231d3532@kernel.org>
Date: Wed, 18 Mar 2026 14:43:50 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johannes Thumshirn <jth@kernel.org>
Subject: Re: b4 review available in master
To: Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev
 <mricon@kernel.org>, users@kernel.org, tools@kernel.org
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net>
In-Reply-To: <87tsuffj7h.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 17.03.26 um 00:28 schrieb Jonathan Corbet:
> When can we have it as an Emacs mode? 🙂

Not sure how useful it is to others but I've started a small b4-mode for 
Emacs:

https://github.com/morbidrsa/b4-mode

b4 review isn't in there yet (only shazam and am which I use mostly).

Patches welcome.

Byte,
     Johannes
