Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D12FB6
	for <tools@linux.kernel.org>; Thu, 24 Nov 2022 17:49:47 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b2so1598610iof.12
        for <tools@linux.kernel.org>; Thu, 24 Nov 2022 09:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mrm+SE/XWX3J+o8bdy/xmd+6XcELgvfE+thEwOKFiFQ=;
        b=MPs+aoqerQ9YTTfub/jetHF9EiagjXROLvN0C+i0W4C/Y1fxR3oRZgiY9AiXAaV9au
         ZO1ZOe9Xic6LgTQXCz8UIoJ90H+gbZ/WGT1yDT2XxCfcg2B+qHKN2+/x4aNCJA1dsCZ9
         XREy6QCZ/l3f1gOQqFu2wC19OUnqnEJoUsd3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrm+SE/XWX3J+o8bdy/xmd+6XcELgvfE+thEwOKFiFQ=;
        b=JO+WgDW8cAVWuu/JpbYfdMu5oMkelQ5drJ4ymzxdnskqeUt94zRyXNUoUVDBk40y9v
         hJFThO8LOP+QoUyXaLnSEdEzOSkjDn3ryB5SIAttaRALLZKzB64P4MJgqiMMrvuKAa4S
         BX8VlfsZBItkriIUR3rIr23cWcM+XIHsLKbOJRLK0h8Yr5oZDHLWDbJmQx8+k/hqer9A
         3x7XthmXryJuqDKvIMdOz88SU6dqOaSmbdPbkic+TvESjqGMjw1g1AiHYYnRmH4+3tsJ
         gFjT+ZtP9i5SEw+kK++9AGliqcpdxFTlYCvs6+ru3Oj+IMqJjnOTXv25MfF8p8sOLqFH
         HmYg==
X-Gm-Message-State: ANoB5pnURD/EnCWorGFIMjR5L2bpxHyhY0u83Lh+ppglz3ZL+BL2tqUs
	r2kA0eH3MDW0q5g7DXQAR+pLUOEwaOAvaKzW
X-Google-Smtp-Source: AA0mqf6aOXZtpAShhVPvPNKOpxVZ+XoHVTOL+kl6UYKeAKPmpH86j7M/Rd42bK+1PxS++MORDcy1uA==
X-Received: by 2002:a02:ca45:0:b0:363:a4ae:5a80 with SMTP id i5-20020a02ca45000000b00363a4ae5a80mr16121025jal.105.1669312186251;
        Thu, 24 Nov 2022 09:49:46 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id x6-20020a92cc86000000b003024928a9afsm578850ilo.83.2022.11.24.09.49.45
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 09:49:45 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id x13so1046508ilp.8
        for <tools@linux.kernel.org>; Thu, 24 Nov 2022 09:49:45 -0800 (PST)
X-Received: by 2002:a05:6e02:c61:b0:300:f4ed:47f8 with SMTP id
 f1-20020a056e020c6100b00300f4ed47f8mr6293212ilj.243.1669312185167; Thu, 24
 Nov 2022 09:49:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Nov 2022 18:49:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCs-_bM6kC0cYTCRjCha3n0QVhbC+tTt=N9G4QPwgq3s+g@mail.gmail.com>
Message-ID: <CANiDSCs-_bM6kC0cYTCRjCha3n0QVhbC+tTt=N9G4QPwgq3s+g@mail.gmail.com>
Subject: b4 prep/send: single patch mode
To: tools@linux.kernel.org, konstantin@linuxfoundation.org
Cc: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

I have moved all my developer workflow to b4 and I am super happy,
thanks for that :)

There is one caveat though ;):

When I have to send a patchset with only one patch it seems redundant
to send a cover letter, Most of the time, it is a copy of the commit
message at 1/1 plus a link to the previous version of the patch in
lore.

Would it make sense to add that info after the --- and do not send the
cover-letter if there is only one patch on the set?

Regards


-- 
Ricardo Ribalda
