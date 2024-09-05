Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748A0165F0E
	for <tools@linux.kernel.org>; Thu,  5 Sep 2024 22:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725574820; cv=none; b=lZ28mpQDHEYS+WHJu8sTMJ43NKMF6svUpU+UxthQIEWATofLIglV1W7GaWx4bK7nNtXY+KMcB9wYAhK2BNFffC8XrXxG1sULcW0tXb35DIZ0K1PjuJs6VDbzf8mFsvNO9ZHgpW9QOnsPU7Xc69gpICAHO0ILh8Vu0Sx0mS3UVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725574820; c=relaxed/simple;
	bh=/7VSih5sp10Terce2PDEJeC3VQorXMv0BYj7Q61SYhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ae1pYE8mHqQWkSFzmsffvWJP7fv+goKvkpdE1DrPSL8tTCEdG5VarScsF8xmab3YNALbzFlxB48SI+I5noOtDwAcMwgSyMNekqM6cPXegsWDFfMyYRu4d4soIjnyxuZIBMkKc7huknuaPco9wqkXdz7WzcCqpb6FRzBenkZh/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V1/Q2RHa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V1/Q2RHa"
Received: by smtp.kernel.org (Postfix)
	id 67A23C4CEC4; Thu,  5 Sep 2024 22:20:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E319C4CEC3
	for <tools@kernel.org>; Thu,  5 Sep 2024 22:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E319C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20573eb852aso16571545ad.1
        for <tools@kernel.org>; Thu, 05 Sep 2024 15:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725574817; x=1726179617; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bvESgC7dJ7aV4djic0icYv9+o0ihZYaDQrHiXAUs0g=;
        b=V1/Q2RHa+KQcV3ospYfgfx4MjyZAeCMGLxBc7SBz2ocg1mEDHDK1ckKO1TX+SrEv/X
         MsDFmnksAfrOgqGph3rha017tkbImccZjrT+loBz/i0CchfuQzp6geSYTBnpS9R0eb6N
         jDOPWywRsOFlLu8qYSuMp+ZpNpmqHoIDDS40vaw9AUkH2pHQAH4gYRb9dJZK//kR+NgP
         IQ5lMNadvN68w9HeJnElir26LXbNZW3cBY9JWp/7TZl6ZQrZjEZAStNHKamp8fEu52UU
         BB9S3V1ZJYmcg7cP7DLvQ8oEDTCdlZUIdU7CTL0/VH5d7LwUc6b5ar17iUpiTrF7C+N7
         RVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725574817; x=1726179617;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bvESgC7dJ7aV4djic0icYv9+o0ihZYaDQrHiXAUs0g=;
        b=ZjlPVOko6CE5MdvJ4UcISIIIh+YO+drP26jUN60lgiKrLtT31OSfkrc9AB23rqvPBI
         +g3V+bjxp6Y1ViHMln6aDT251ScQDhQ7iW+YYDrWswnOvy5TbN21u8BKfeVzCSirtom+
         kWrMgSw75NlU7aVcT3v25cPLBk44TtB2o+4KLZ+qvdnCcUpsUKlb3cJzMNOziwnxJFuu
         8SBRzLockSo1wqeE27kGctPBiTE68hHoxMhIvjiIy7MOw7dp58RNvk1pk8N8A8wE0GZg
         UFa6o5qZ1Jq+CIrBqVLaTag3BatI1CKe0RSzHfOoPXdvftPBasOIldi8B3Agjc8grJ4t
         /ReQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk6QftCRAmeUstYByq5eJSshoChl3P8iXz7xK1WseY3XYd4ibfs1571eegt3Zv2xyFp8TOog==@kernel.org
X-Gm-Message-State: AOJu0YyyEWcQ8gG/PQMzqhMxe6WZi0Bbnuh9QXHgORsRqh1DJ3BZ38wY
	rWQHIvvwYIZRxaRePfFnFfigYqJLgiqelZd8vji9nKywc0daJUCl/21I4vSAH0c=
X-Google-Smtp-Source: AGHT+IGEC+5CVI46QZRV65hgVh9iODuUw3iJZk8RGxBX1h+dGtgaNXfmIA6WspOq2hGMLlMWT9P2Cw==
X-Received: by 2002:a17:902:ec91:b0:206:9c9b:61bb with SMTP id d9443c01a7336-206b7ce742fmr103047425ad.6.1725574817217;
        Thu, 05 Sep 2024 15:20:17 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea533b8sm32743225ad.225.2024.09.05.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 15:20:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, "Kernel.org Tools"
 <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH b4] Remove message-id from cc list
In-Reply-To: <draft-7ho75avvwk.fsf@baylibre.com>
References: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
 <draft-7ho75avvwk.fsf@baylibre.com>
Date: Thu, 05 Sep 2024 15:20:16 -0700
Message-ID: <7hikv9agkf.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> Louis Chauvet <louis.chauvet@bootlin.com> writes:
>
>> As the algorithm to detect mails to add in CC is very simple, it also
>> include the prerequisite-message-id to CC as they look like mails. In
>> order to avoid this kind of issue, filter out prerequisite-message-id
>> lines.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>  src/b4/__init__.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index ec230e7ace66..b0d91c0e4017 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -1990,7 +1990,7 @@ class LoreMessage:
>>  
>>      @staticmethod
>>      def find_trailers(body: str, followup: bool = False) -> Tuple[List[LoreTrailer], List[str]]:
>> -        ignores = {'phone', 'email'}
>> +        ignores = {'phone', 'email', 'prerequisite-message-id'}
>>          headers = {'subject', 'date', 'from'}
>>          links = {'link', 'buglink', 'closes'}
>>          nonperson = links | {'fixes', 'subject', 'date', 'obsoleted-by', 'change-id', 'base-commit'}
>>
>> ---
>> base-commit: 99b128995f27cd9aa6fa8adf7588f339919ac14d
>> change-id: 20240828-remove-invalid-cc-eecbd7d43b3d
>
> I have not been able to test (yet), but I'm guessing this should fix this
> bug[1] I reported a couple weeks ago.

I can now confirm that this patch fixes this bug[1].

Thanks Louis for the fix!

Kevin

P.S. is there some bugbot magic to connect this thread to an existing bug?

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219138
