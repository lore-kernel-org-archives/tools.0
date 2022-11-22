Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD211C15
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 20:44:59 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id h10so10891431qvq.7
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 12:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nve/9w/+QBfFmD/eliSuXjeXc5nmcRPwlaqtN1dlN1Q=;
        b=IwO4LKgbKzU4DnOfxh1vrLGXSRcLsLvjZOABvfR/s0CgV5b/KWKkWq4farProJPexo
         n5szIej8vI5sbhif7elbJzaUEvFyvwIM9Cn6tjtYZkxVuyObhuQGrGx7+00gJILsARJU
         ZRUxPEjkj3YKS4WAETPpZs19SFABIdMnfe0jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nve/9w/+QBfFmD/eliSuXjeXc5nmcRPwlaqtN1dlN1Q=;
        b=42RiLXe7/YcECyikHA25bJJ8JM7U3X7kImbmuYpvdY3IJjuH91BssfV3dFLhLPxMg6
         xHSjTHIL3508Hme/FhUu6oKJr/gb+Lj3MXrLqeuCcTs4Mnsnt4AqUA/cX6chtJ0kOdO/
         m4mRhB0eHZotDa9w6qu4QupluGhWmqPOv9APl8NbSKwKLX49xzHCZGzTs9sc/NenRtbh
         2yR/S7ehSPmjlf2ok5oYxttWebdjX4kI1EZcV7ZLwkyEsL0G8+XseV2MCkRkDsJhWlGn
         QwmoB78Z/vgGOgxH6W5mVD1yqJlqub14q0WQ9yUptS5ep3AtFxi3C+lvkDkRSawcgQn4
         EKeA==
X-Gm-Message-State: ANoB5pmxnAnN1cZHY7YnipMzUKNEM3l0gqOhmMFry7yWVQZ7f57cP5G8
	HdSUYVvr8oGX5P4cwMN86Ty684+Zyadxvg==
X-Google-Smtp-Source: AA0mqf758o9Iy9Kc5gFTxrFGD5th+xAtyBFlzKBG20rDV4rRgZZEBsClGc4f0U9xSeekMJUT0/Er/g==
X-Received: by 2002:a0c:d806:0:b0:4b1:d18b:642a with SMTP id h6-20020a0cd806000000b004b1d18b642amr5041764qvj.11.1669149898526;
        Tue, 22 Nov 2022 12:44:58 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x12-20020ae9e90c000000b006b5cc25535fsm10328379qkf.99.2022.11.22.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:44:57 -0800 (PST)
Date: Tue, 22 Nov 2022 15:44:56 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221122204456.6tqutsoybrisa4xf@meerkat.local>
References: <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>

On Tue, Nov 22, 2022 at 09:26:03PM +0100, Noralf Trønnes wrote:
> > However, I see that it's failing on Debian 11 with the JSON error.
> > I'll poke some more now that I have a test env and follow up.
> > 
> 
> Yeah that test snippet fails with the same error.
> 
> $ lsb_release -ir
> Distributor ID: Ubuntu
> Release:        22.04

Okay, this is not a real fix, but it will get things working for you while I
implement the proper solution:

apt install python3-simplejson

-K
