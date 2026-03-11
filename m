Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71253DDDD6
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242836; cv=none; b=bJzHq1vewd6njq9q1GBR2Y4raLmsjNVn5/RIS8Hc2ZsCbuK8Tp5Ldyxnk/VRhDzZIyObjqmDxnlNbuRAqTHJE0bDjZEkjEa+8RJfc0+OOGFOFMnlof7j2ueWY8PewoxDt6qVoFidnNZS9bWvBlHrWsYPoc4NCTv3OMYQtihYXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242836; c=relaxed/simple;
	bh=GxJSkEJ9nAJh+D2J4f9msUEXOnTNJehEd2X4LcrUqnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QALe1jisvRQbVnIgj2DeIeZyVWUGvXPeUMNtHn950WifP8Fqx7lLRMee1Kdz0O2XJ+fgcv9ao12olUERLxjcGQIYmuYNI4rC8j1FMyaWi1YZs0LuxCnw3Zl1LrD3pBKJR8zCRbcb3ma0Sl8XA/0Nwh2vx6+fh3tjPeb3Jid3ZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BbewQbO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BbewQbO5"
Received: by smtp.kernel.org (Postfix)
	id 95EECC4CEF7; Wed, 11 Mar 2026 15:27:15 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DCA2C19424
	for <tools@kernel.org>; Wed, 11 Mar 2026 15:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DCA2C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e58404f28so6462e87.2
        for <tools@kernel.org>; Wed, 11 Mar 2026 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773242831; x=1773847631; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3GuM5zZKOj5pA5YlZg9beD8/BuxgxMAgAmjCa3YnNU=;
        b=BbewQbO5yL9V0w2mP0L8clCgDbJou/qrS26BPfrA+IUh0AQNMJZPgl0rUGIZ4PAqZi
         s+0aAHsGCOPhPBF6pwJeVRAUS73ofEgNQTvCXRhqB58/372crkfWYD/klXGvfVwIYwX6
         oRoHjaM+jZY4/nHDzyvy/9nrXGiYgQ2PeGcCVW5SyqZutjJVjhKPKF5yVozJaBYvHjbA
         wE3AcJ1CMOWIxj2e0ArEHlGL/pnDlEqbUcyL2GqgBzMbkXbosR+oxES3KR3QbAGOavdW
         MXEbA365n4Lxhhirh9MSdYPy66tUWO7SoYmRGqTXz51BRjwjzp7mgBx/AdZLZhV1c2+K
         DGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242831; x=1773847631;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3GuM5zZKOj5pA5YlZg9beD8/BuxgxMAgAmjCa3YnNU=;
        b=B2iw3NdQF7O1sr0VgmNT2IDpQpK+2WcGCNzBX07MXPNxLEJkUoJyJdVStyAi2n/XrL
         /Ezsy7MIp5YYxqqf3n9NOmoFlUwJuJ46Isgh8IV4O9E1shbzcsG9aNbFqGA5TUT51YTq
         AP5zDepqiXYu0lWoWrQq2ORDVG9xSuS3ZgmDbfbcauRDv221fLbLbxUK4lmTLhM0ViA0
         ztNqYFLrKTKbIcD6p69tASOUSMT+2ffrmngjpoUin/bEJMiimZfH64mnDdyIrKzGuW6K
         orCVjEip/9+ovGSY6yORRN24Gp5DnHF7tgEHKpQpwb5bTDB/X0ucZgGxiUz1JQZMrGE7
         OUVw==
X-Gm-Message-State: AOJu0Yxw4QHPe9n5YNYKzaQiFBwzttlF9oLu6FnBjSBEUfIOEO/HILon
	2fBoxr0uMxVzveDVbhcokYDS+jYOD7BGgzDQ8rnn6SIZ98Nxgyz0OuJQJL2qlSAyWuo=
X-Gm-Gg: ATEYQzw11bO8aZDNA4Y/gcRGtsQkuklGKGt+GdpVntoK3HBUsAmyGfgQW/bRX4mI7ic
	62305NMcjWQYBSZvMaiqEnrWH8w27P1HE8zpnFv6YISEKfrrzGox17zc9fRrJDLjbw0KFGCZeez
	uQmCadJPTvmp6fGoq7i8Ne/9tMSOeKhXTQLGIY9+1VFZYScl1ATz78QuUvG60T1asgjkClxdhQg
	eW0GNtmWj9QgqveJljoOa9ioQNTHDQko0W1MZAYxlxLKWCWYd7Vil+c2aPvXIEHZK8vZsib/Mcr
	9IdQ43+myetn2a52SMnEDkmR1ePL8pscYxeTaGfxXziaWxxFPec6BnLzKlyJEPWLDpa5UYrtfJR
	7cuKNSZuCAS7hbnWp4Sg38HU1LlIBhFfSTOo9KM96ZfyWmmApLxPnVCHjAtKJGoE1LvLAtWkKUK
	9COcrRfHJrw+DKQHcg5afeDzphjxT6mRnm3TKbYSKjGDVCNQPd004WesxYPg==
X-Received: by 2002:a05:6512:61cd:20b0:5a1:3921:ab52 with SMTP id 2adb3069b0e04-5a156bb0d12mr394012e87.2.1773242830500;
        Wed, 11 Mar 2026 08:27:10 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c8bsm472077e87.3.2026.03.11.08.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 08:27:10 -0700 (PDT)
Message-ID: <c084fc4d-2990-4564-9080-1b7de4a38fc9@suse.com>
Date: Wed, 11 Mar 2026 16:27:09 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix typo in maintainer docs
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Brigham Campbell <me@brighamcampbell.com>
Cc: tools@kernel.org
References: <20260311074014.289088-1-me@brighamcampbell.com>
 <20260311-invaluable-attentive-gopher-dd0a55@lemur>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260311-invaluable-attentive-gopher-dd0a55@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/26 15:39, Konstantin Ryabitsev wrote:
> On Wed, Mar 11, 2026 at 01:40:14AM -0600, Brigham Campbell wrote:
>> Fix a minor typo in the documentation for `b4 review`.
> 
> It's not actually a typo. ;) Welcome to the Canadian spelling where we
> arbitrarily spell some things the US way and others the UK way, and many of
> them are correct both ways! Like enroll and enrol, which are both accepted in
> Canadian spelling. *sigh*
> 
> However, since the command is "b4 enroll" and not "b4 enrol" I will take the
> patch.
> 
>> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
>> ---
>> 
>> Unrelated, but thanks for your work on b4, Konstantin. It's been a
>> wonderful help to me so far. I expect the new review functionalities to
>> be very useful for reviewing many patches from kernel mentees.
> 
> Thank you! That's my hope as well.
> 
> Cheers,
> -K
> 
>>  Enrolling a repository
>>  ~~~~~~~~~~~~~~~~~~~~~~
>> -Before you can track series, you need to enrol the repository::
>> +Before you can track series, you need to enroll the repository::

    ^ clever!

>>  
>>      b4 review enroll [path] [-i identifier]
>>  
>> 
>> base-commit: cba5b5a9fd6078646a58531643e7365480504d77
>> -- 
>> 2.52.0
>> 
> 

