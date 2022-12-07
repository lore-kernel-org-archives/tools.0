Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46248BF1
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 20:07:50 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id y15so17070669qtv.5
        for <tools@linux.kernel.org>; Wed, 07 Dec 2022 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hr+2qyMQgiOnml1/CkeYnt1h+JCFmdkm1cwET+q10d8=;
        b=cjBt3kDq/759gT4ljv1kgGCWLxHmDrmhHN8qOVTRR2gs2V/sox31rlkV7xL7Vm+OMs
         Ah0PLlv74iT2NQxja96TxdZ00nic54Rl9zLnpvPrzLKHSfn6M2FAUymFZdjhKVLeI2Kv
         y0n0vsGjjOFE7qXVFM9x9JEDYV5JuYZtL+73w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr+2qyMQgiOnml1/CkeYnt1h+JCFmdkm1cwET+q10d8=;
        b=g1/huo2YH0q9xqabVTVz8678HZukHJPaKnPzacp/ZhmN4+WQSOoUMx7FD+fxpl22OU
         i1X7zj2JJCtISKkCt3sNQuryJ2fNSJRX/DuC2bjJ4u5cVqowItmodoOFlRNjYjWEY5BK
         oBsGkykR2qqfg0MDgbUXfezRasWu7O50Woq5MxUHrHK7flgOqbojrEnCNQQUlTGjNoNL
         bkyYhW/hh5539OTgZ8u6HgJ2g7meRgUnMCFx044cixQO2VOrCZDO+/8kU46LNt5DHaEP
         kgW534ELXyJc/3kYrqNSVy9aWk33/MjlcL9rtGf8FHnQHFiog3AgNFliEzbsfGSw9E61
         EkVw==
X-Gm-Message-State: ANoB5pn9M7lguHFpxQbtKIBID6HP0Bs5v14k/oFBKJmwK/wSwliPFO00
	4W5wTqAtTd8qxWG1RMrWVo+o+w==
X-Google-Smtp-Source: AA0mqf4YR/WnHLL7/1gNpdZ3UE8UPk55O8m4ELsdRTDOg+JViWHnuPYW7xRifykgieGua4hWeDwZ/Q==
X-Received: by 2002:ac8:43c6:0:b0:3a7:ed2f:ae0d with SMTP id w6-20020ac843c6000000b003a7ed2fae0dmr1166123qtn.29.1670443669464;
        Wed, 07 Dec 2022 12:07:49 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id d11-20020ac8534b000000b00342f8d4d0basm9573126qto.43.2022.12.07.12.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 12:07:48 -0800 (PST)
Date: Wed, 7 Dec 2022 15:07:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: new: b4 send --reflect
Message-ID: <20221207200747.e7ycznkcpvcafbbe@meerkat.local>
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
 <20221207182156.zbwmcdckoegef6lf@meerkat.local>
 <f0394397-0cd3-72db-36c2-91ba1f98b709@tronnes.org>
 <20221207194544.ei2nkaw2lvvs7ifq@meerkat.local>
 <a0f80fcf-be19-3dd2-6d6c-0f9795f3e2a4@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0f80fcf-be19-3dd2-6d6c-0f9795f3e2a4@tronnes.org>

On Wed, Dec 07, 2022 at 08:54:20PM +0100, Noralf Trønnes wrote:
> It's working now, thanks.

Great. Thanks again for being a willing test subject!

-K
