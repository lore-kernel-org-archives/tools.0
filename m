Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C362AD2A
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 01:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709255600; cv=none; b=js6UGyi1F+01hAy7IBmbqhdCfBRK1S8goUBe0UThrMx1rwyj+Pd9OHDlD7vzii4lnNOz0XADJaHIiGvLXZnxFhRIpY+cyzghmNiw0p7ZO/KfmRlkegpbgK9FqAl66EhAmNSdVqp3ETkX0XZ0+7U203muX2f//qb8YGlLBXYVTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709255600; c=relaxed/simple;
	bh=ZuvjqH3HIFy12XQQHy4pBaqVidAhTDkX4wpKeIhtGms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jb0HAMrL4tcguUdAiD+DEXaXNuKzTuAHNjrML0wwhGC/ayZU8H8VSzEDyjxMB3O7EEITYVF7KNLkyWAH8dwbWSGtxMp+BZqbrtuQSaObA9D+gipERws3XkS5nTV/JhA4OJXTMXv+AI0PaONPqMFFSVuRwq+qA/VYq1eA38LvUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 465EAC43390; Fri,  1 Mar 2024 01:13:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 675C2C433F1;
	Fri,  1 Mar 2024 01:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 675C2C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso1337466a12.2;
        Thu, 29 Feb 2024 17:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709255599; x=1709860399;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUmSc9gRpxsRRwEZsMBIvA5Xuuwgz+nXXOF7b7dCCgE=;
        b=xTK381tBoPLFztHPMqeBH+zIOvuNL8RE8JSk1008VLS4avfyW2NQzUsn08y7Oy89h2
         dqct1spgtOzaQppX2qspsawMqYljNCRy5oOZzTciRHbKj8fVeF30UTbC3WD+j4071OKM
         nSGdKlhLvZ7N7vFHGec5W7r/vtZF9qToLc1Vu3rzV211s2TrjbFlWFAAU/fyP3Hznd6d
         AhUsd8czB+dEx+qWsEBxyFwPXTr8h5m/qBzk8FacM6NZpYTOkOX6CFy/uT0bKbU/ppTZ
         d2fU1mTlcYIhgG0ZdIkJHcw2q5EXATvIHL4NmsVLnh7WLoUtUO/VgBtZwWnchDu1kP4b
         O4zA==
X-Forwarded-Encrypted: i=1; AJvYcCW/Gdm7XBLCJ1+dUXns/42U916voBF9s3invAhue6fLxxgs3ecqwwVsnTA1xVCQSJM2jyhQub/VmCj0lujbtoRAQRPB2L1OzQjb0OTPqqEpP0Dg
X-Gm-Message-State: AOJu0YxMhmY6sbW5SJ3E7TwiBXu2Dv8qETlLIv2h/Mt8Z1a/xqp9aW8x
	vzqvxmPgWmuBodO9ovnmIHvhGwZZLQeoJrMsvpSjEj3DDGDLR1F0
X-Google-Smtp-Source: AGHT+IFt0qFrm7keCtP7YEwddle58URI8bgB2yxoxq5IX80T9wgjzBezyN63oCCiyPW5VoRuLtqmbA==
X-Received: by 2002:a05:6a20:244a:b0:1a1:34be:24b5 with SMTP id t10-20020a056a20244a00b001a134be24b5mr157813pzc.24.1709255598567;
        Thu, 29 Feb 2024 17:13:18 -0800 (PST)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id ju16-20020a170903429000b001db5ecd115bsm2155836plb.276.2024.02.29.17.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 17:13:18 -0800 (PST)
Message-ID: <23f843e8-2eb6-4b25-b515-44c6cf5e49d5@acm.org>
Date: Thu, 29 Feb 2024 17:13:16 -0800
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
To: Hannes Reinecke <hare@suse.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
 <5758922f-a11a-4bbe-88a4-b724f53b2e6f@suse.de>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5758922f-a11a-4bbe-88a4-b724f53b2e6f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/24 23:18, Hannes Reinecke wrote:
> Now there's a thought. Maybe we should do exactly the opposite, and 
> posting _more_ ChatGPT generated content on the web? Sending them
> into a deadly self-enforcing feedback loop?

That's a rather negative view. Besides concerns about the energy spent
on training LLMs, in my opinion LLMs can be very useful. If I need to
look up information about a kernel subsystem that I'm not very familiar
with, I type in the question in the user interface of an LLM. While it
can be very hard to look up information in mailing list archives with
a traditional web search engine, LLMs can give accurate answers quickly.
Here is an example of such a question: "Why does the Linux kernel cgroup
implementation propagate statistics to parent cgroups periodically
instead of immediately?" Both ChatGPT and Gemini produce reasonable
answers to this question but the web search engines that I tried did not.

Bart.
