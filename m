Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C81F5842
	for <tools@linux.kernel.org>; Mon,  3 Nov 2025 21:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762207090; cv=none; b=Y12PjDD2G09+5HAKz/wYw4QTJXSH7fHbWvAM7HDSpdIta6RajowlfheCmW/ITgnuNQCXFJsSLEam+oj3FxTGxwRGMuKmjulBGPiw8qTi7q7g11oEUEIXo72v1kfVleDTrlggDDD/sWTClUOstxUKBdddSQSq0xvPZtRcyoTIELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762207090; c=relaxed/simple;
	bh=2Y4mQ9FWcU4jkDRglujFQbdAUoUDJrsSZpXV8UiOnSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edcLbFmMJLJ9EQazrQh5F9UvUUIvmcYYNdZdSXiByDKkwzOyL0XCYmL6qsKVSnWnbCoEFXgELOMuzFRSWmVtimEkF37jFKIZXFUTw+v4s7iIQiY7MsceLvt7BH/0XDd3mdIpH2AmFgB41WeWgUF8yIlCVqSmqbA9J/+d2d/QBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrN+vAO+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrN+vAO+"
Received: by smtp.kernel.org (Postfix)
	id 77E5CC116B1; Mon,  3 Nov 2025 21:58:07 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6032C4CEE7
	for <tools@kernel.org>; Mon,  3 Nov 2025 21:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6032C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4e4d9fc4316so55497501cf.2
        for <tools@kernel.org>; Mon, 03 Nov 2025 13:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762207083; x=1762811883; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Y4mQ9FWcU4jkDRglujFQbdAUoUDJrsSZpXV8UiOnSo=;
        b=MrN+vAO+kFYI/icj3hRStPGb+i+wVcs5c9aMaC4YLgy1Xgy9i4gPY6Qiri6s8P+Ce8
         BxPrcxx5ty6OFe+jrozq7d9KMu5Ce5q/pACN7KcHaPbZQfdWeHRNDz6BL7t/pk2yClHy
         emB9RtwsoAKw39+fNXHgqIw2SbepwKqEuLACwUB11rYyTHPc85ZumUXLAd7bNoVt2gap
         nE7u/HvmvUB/YoeYa1+OPXyk2ZIzyQhgxFT4jlhB6JR/DVcINId/8OQR9ofSXu5bDI4W
         TgNvZmok6jcstqKBRARdVo4nhHclNdhgu0uT0wpFO8W5n/r1gSlI/Wy2+u62RCt2jF0u
         oCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762207083; x=1762811883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y4mQ9FWcU4jkDRglujFQbdAUoUDJrsSZpXV8UiOnSo=;
        b=Ub6Kd1nu4S+dQm/wHF4BifWHIPa7uVp32eNlfr8azoEcwd53NUxcxUtPwB61C/WIaU
         lQQlZVw/p15TIcsRmesiE8S1A5rdWkq5nE5Twj2e2rgheJSdcvZYSQiCdUEAG6zoMBC9
         is6JFDELyIHFg2VpbGec0wCzi7h7tU0K1GC8tLRNbxrwi8mrCFCf4ZtD6z2FiXY8ojp0
         ZukYcWyb1zi8Bq4ycfOHkqKcBsIYROwJOndue5qeJcPDHKJr6dae1QqeW+B63R+ybeui
         YLm3LAF8ghlIbC9s8llkfPWWn01OkWyLYQVXmw9MgCHBjzeiJW3R1+BvZ6lOAnvJZY6X
         nxqg==
X-Gm-Message-State: AOJu0YwDAg7vjmPwWxFeZWJdFiry3LbxKD05lSOPepmMS0MTxTrgIfm9
	yD8YVSe0NifefmC2TsiO2A8NuLNPrvC6JdUm0yqgBkrRQI2MkgsYdCdE
X-Gm-Gg: ASbGncstNIe18wFEgrHCAzPwiAhpBWAnzW0HpvdsnM/H1ttir2BEn/a8kIDjqfVL9nu
	+5cqEGTm5+0vKJEF2H5bjE6Da/0Gjc07RCTBLk0M3jt/9onMjKqvkUcSThFuHvOz3qtCkkXc+yc
	lAej/sZ8Ii0NuR5hULhRkCbP3wkohn3fC912OX1Z3LAmQZ3WxZ7uXAT7nbDOFBQboabeurgtUZx
	CBsZCjLimrOqiwLZoRvB006mbMzxAP5PV4WUlqhMr+/f7yFzKECzFf0ynMHSLg8qDPiIE0Vh1B2
	T3kM4mtoQEhZF1pImQgBiiTGLJK6FYhdb9TLwpW+zDXPkMB22K8D6ZwGrUilGG4QZHDl8lj8hS0
	6JQvMeBM8ScU8z9TMLxcjIX7TgAUx8teMjEj6wg5yuRLlPOt/zojDqbgy9kUKMYCU2gxQnSqG6G
	uz3yP/tO+MYeQcGcXP5pitRQpjYcAfEBemClFW3LEpqA==
X-Google-Smtp-Source: AGHT+IEjo5P4ouCEwQVyiHF4fUJMzhSz7sB1/JQ0P0SZ8j9QoqrV/ygiNXwG5D1M9grl6i4gUZ6VZA==
X-Received: by 2002:ac8:7d0c:0:b0:4e8:b5e8:2a22 with SMTP id d75a77b69052e-4ed30f8b033mr166267881cf.45.1762207083401;
        Mon, 03 Nov 2025 13:58:03 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1145:4:4f8e:426e:4bcc:9f8c? ([2620:10d:c091:500::6:ab0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f7bb3e33sm63135985a.39.2025.11.03.13.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 13:58:02 -0800 (PST)
Message-ID: <90e3d3c7-ec42-4a78-9922-96c89295bbde@gmail.com>
Date: Mon, 3 Nov 2025 16:58:02 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4] main: ez: add option to use git notes for prep and
 send commands
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20251103-notes-v1-1-6c5a561e4ba6@gmail.com>
 <20251103-outrageous-rainbow-sheep-e2b0b3@lemur>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20251103-outrageous-rainbow-sheep-e2b0b3@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/25 4:34 PM, Konstantin Ryabitsev wrote:
> On Mon, Nov 03, 2025 at 12:46:59PM -0800, Daniel Zahka wrote:
>> It can be useful to keep a per-patch changelog using git notes. Allow
>> git notes to be added to commits during export from the b4 prep and
>> send commands.
> Hi:
>
> This has come up multiple times:
>
> https://lore.kernel.org/tools/20250130-rich-orangutan-from-eldorado-04f621@lemur/
>
> The answer is still the same -- until git-filter-repo does the right thing
> with git notes (as in, actually preserving them on rewrites), any solution
> using git notes is too fragile to consider using.
>
> -K

Ah, I see. Thanks for taking a look.
