Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE679C0
	for <tools@linux.kernel.org>; Wed, 30 Nov 2022 19:39:55 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id c14so8718259qvq.0
        for <tools@linux.kernel.org>; Wed, 30 Nov 2022 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1IK82npyo783/NfsA1O9hSr/RpUyEMRvKh67D8KRBM=;
        b=HD0KmIXIDxfccGnX54JEXR+tYq6c9p7R3gIyA9gSxw9uqmAtqo+qkAfEpoXYAm10NS
         Cpu2WLot1UI55cMXcejc2+0pJtAceXSIH8YX01YXjUFZdTw0dek72TJoDTE8LqxD9i9r
         v4R3vs9gxQtT0k0MpvbEhdro3N5QIxdj1uPo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1IK82npyo783/NfsA1O9hSr/RpUyEMRvKh67D8KRBM=;
        b=UlXON7O9R4bT+hZYtZ+2iAocjYWh9dwQHH27IO1MiFZKsFeHQv9DTRv0U/g0+Cu5kQ
         pI1/BFz8oCG1rKV2peZehkGGwiNHDxSegOOvT+/JJ7cWWgasPF0COY/+eQe1weidU9Ll
         XV5NY8z9m6tb+2+STf60JViSAHEASYKo2OZt6T5gBHpiFgTLe12pEH1Pj0Qi4IkSXUPg
         wUOc8crR0Y4HU8JjWWSssYJX1QqCrKzVyB/7n0pKR+Esrhjfq9mprTc3Lvwt9v2uM3GG
         M6O8348dJQ0lDJ9cab0QhTy0Qh6XWxXhV6saQWiu6UgVS8BFamHzXoYB75jQEW/N3UeE
         716g==
X-Gm-Message-State: ANoB5plqPYL+/MpJcH6WPWDf3enVKe+d8HLPfM22o3qjZHhnN2dxFtF8
	IFS7uCehCbRDVUtFEdy0FuK7n0YGK056sQ==
X-Google-Smtp-Source: AA0mqf5Qde9U8e3nxAOXxSrT507IghEde4x0QLbwcYZfJgNMy6DJAGBbupFrCN9ot+4p3THLdvJqxw==
X-Received: by 2002:a05:6214:4201:b0:4bb:6cad:7c82 with SMTP id nd1-20020a056214420100b004bb6cad7c82mr40370216qvb.17.1669837194207;
        Wed, 30 Nov 2022 11:39:54 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85153000000b003a6328ee7acsm1315497qtn.87.2022.11.30.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 11:39:53 -0800 (PST)
Date: Wed, 30 Nov 2022 14:39:52 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221130193952.twllu74eduajrauj@meerkat.local>
References: <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
 <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>
 <20221130165557.7ptog2pdgpa54377@meerkat.local>
 <77d7c98c-2fbe-d23c-b772-634b2a377761@tronnes.org>
 <20221130191736.pdt2x74znz2tcfxy@meerkat.local>
 <da129f85-45b0-2544-aca9-a674ed5357a5@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da129f85-45b0-2544-aca9-a674ed5357a5@tronnes.org>

On Wed, Nov 30, 2022 at 08:34:45PM +0100, Noralf Trønnes wrote:
> Thanks, working now:
> 
> https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org/T/#t

Great. There's still some weird annoying stuff with encoding happening, but it
shouldn't really interfere with anything. You're a great testcase because you
have 8bit content in many headers of the message and it's tripping up a lot of
my assumptions about how Python would handle things internally.

Thank you for being patient!

> https://patchwork.freedesktop.org/series/111222/
> 
> Is there an easy way for me to use b4 diff before I send out a new
> version so I can see the exact changes I've made so I can make sure I've
> not messed things up or forgotten to fix up something?

Yes, if you're using the dev version of b4, you can run:

    b4 prep --compare-to v1

This will give you a range-diff of the current branch against any previously
sent version.

Cheers,
-K
