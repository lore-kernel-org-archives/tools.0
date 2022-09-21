Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3C3211
	for <tools@linux.kernel.org>; Wed, 21 Sep 2022 12:23:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t14so9581262wrx.8
        for <tools@linux.kernel.org>; Wed, 21 Sep 2022 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=Nu5tXmI5qIPY9kppnpLRluAD9u5GZPzBpKMo2E3aeCU=;
        b=2eYAuZeABLiXXKTL+COPcgobsSnO54sAwepC3acoKTRgw0GFLBlSj8/tfRCJB4ujFL
         IZNPke/FfVMYKoomJTXVOhYTypcBb/JoTWO7NDQhYq6acHQWwdJxTbrHktQiq+cIKFrj
         Jjdl505KfJyRRyVHAclmsoXhb03ou11wSwpreJRx4vKvOOcbuHWJN7qAmfncpW8IYW4A
         o4NpioSF17Hd8SAj4alt0TW7wKwFuIjVU2kXFg6WW4xJqjH2pBZ8asUWK8Soto6Ue++C
         Qg5bFQbVefyMFHPbHNC7xjctt8TegP2Uiyj5AGfCRTZJ8dVyHEPSiRY70AmNdYZMnot9
         02ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Nu5tXmI5qIPY9kppnpLRluAD9u5GZPzBpKMo2E3aeCU=;
        b=p6FVHIcJaPzdjFS4rXFP8ukRFYZrPLOHyfqt2IMAWDAn9Yiyy16gT3ce14PY90tGzo
         ypnNCYjaDrp/SYv1K5WIX1v4eD6RxHG9pnehXHO5cJH+e6Peo3lwwm8oXtihiEgPGPOL
         9LOAUdeYW8iveIoXiAGgBmJrjuKjTB5lr2Sx0yM8RUU1ou248hVkjk+cVb9Hzinkuq43
         ClBxqqUIboSUuzk8LzGe2MA7mwn+y7qJ7TPgpXeNTK+P7xxLpQTJ+EP54l98rmHRv2uf
         V2vmMlTHcsFQA/JEDwvEk9iJLmkw6P4evzc1aqJOBESOGB9DDsuCLNwbLGJQg5Abej+F
         UWOg==
X-Gm-Message-State: ACrzQf2/Vq537fpYKFNRspgAcsiLOE+I/mGVV4V1UFQtYozc2RmV8toh
	f3MfLsm4rmFMzsCyqznpANihzywHX5CpkrZS
X-Google-Smtp-Source: AMsMyM5rKcAFY1y+RqqjlMkl+GOKIF0maOFa5smdNHBfKh2+qwbn2zbOnc9qVfSFfULIzkF+fKxnxw==
X-Received: by 2002:adf:fe08:0:b0:22b:311:afcd with SMTP id n8-20020adffe08000000b0022b0311afcdmr8490521wrr.629.1663763000960;
        Wed, 21 Sep 2022 05:23:20 -0700 (PDT)
Received: from [10.106.1.2] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c4f9100b003b4cba4ef71sm3092367wmq.41.2022.09.21.05.23.19
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 05:23:20 -0700 (PDT)
Message-ID: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
Date: Wed, 21 Sep 2022 14:23:18 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: tools@linux.kernel.org
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: b4 cover-letter in single patch submission
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I would like to open a discussion regarding b4 tool. I read in the b4 
doc that it will always

include a cover-letter even when sending a single patch [0]. This is 
regarded as a proactive

feature in case the submitter is later asked to split up the single the 
patch to many patches.

However, this can upset maintainers and reviewers when a single patch 
(that does not need

to be split up) is sent with a cover letter that would probably contain 
the same title and text

as the single patch.


My humble opinion is, adding a cover letter to a single patch should be 
an optional feature.

In this case, it might even be convenient to keep the change-id and 
changelog in the patch's

comment section.


[0]: 
https://b4.docs.kernel.org/en/latest/contributor/prep.html#what-if-i-only-have-a-single-patch


Regards,

Amjad

