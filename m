Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F8C29A1
	for <tools@linux.kernel.org>; Fri, 18 Nov 2022 11:32:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l14so8874235wrw.2
        for <tools@linux.kernel.org>; Fri, 18 Nov 2022 03:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2uB52WVfXvn5YbCH6WJGvq5GXUI4YG6UAgjcAMAawE=;
        b=gIbeEd/wI0fCAVU8iJ/zJ8+vQzFykKnTOa1VPTlLraj/uubKDq9yIzeltt0JLiT3Tu
         /6iQX5YUp3VFtXbVJxng4T9QzZ9kiXgJXSrZ/YaxL7qJ7Lo/SXubm/w3eYyhYY3ai8KV
         P0C1JiZW1dAEp1jULdH5yPpZ7ZTKjP3tMbRZzVM4GBw4qDSMN2pB/AxTVExcYxs4ciue
         h7Je4HODe6VCvP+o+MfWO0OgWb6H/eohwpWKuFY/ykC4TWothljdjmqXsaRnHI2arWyM
         UI+NXWOhHnVSHgLnEU5FWQ43YpFeCgHKUMc7MnOsohUtD4r0MoUfF0kBTP6xI7aYe2TC
         ozMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2uB52WVfXvn5YbCH6WJGvq5GXUI4YG6UAgjcAMAawE=;
        b=hIh9bRYxutCInZIo7+R6BzdfqFBULydUL5DAloNNLNIQ71VUcHNIbWMvmprDX8vgaj
         /V8qjmI47QpeUHXC0itxEI5Y8pwGJCYJ0pBopI1OiLneLgM6xBDgWPzHiAwRM2EbOKop
         8CIS2d0nxs+4mdFJhXVX8NBq/poDruaOcWQw7ps2wHeYmpTIyktj+cttUw6Hnaz/oSyD
         8Z8D5byO/myopatlYSSSVOXm/VqwFxiqaaPJvlw+B10W9bvFW7JX9bzhVUUmMk5j4Hh3
         Iyysp8jBp++hI4sQTnsFD5zeQvxSTkcdZEaK2Xa1mR1ttYnfhMSOhABcmmAvfnWz8qma
         uceg==
X-Gm-Message-State: ANoB5plDzQGN2iJwGfOFiuT8iC5dJ6/VXJgKY51rR6AB67vWeqGZBkTz
	v/Q3w+Dk903flbep1LzBs/MtvTpo7Lh3qg==
X-Google-Smtp-Source: AA0mqf4f9SXYo4+Q0dhhQSfyaVyT7CbYPadkozUt1PzV2vUrqn6ecY0tLMmaFRHjPEItkvGeag0yYA==
X-Received: by 2002:adf:e490:0:b0:236:76ab:3e01 with SMTP id i16-20020adfe490000000b0023676ab3e01mr3835371wrm.107.1668771135766;
        Fri, 18 Nov 2022 03:32:15 -0800 (PST)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b003cf4ec90938sm4633508wmo.21.2022.11.18.03.32.15
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 03:32:15 -0800 (PST)
Message-ID: <da7e0535-d9f7-1554-f0ea-46bc869f4012@baylibre.com>
Date: Fri, 18 Nov 2022 12:32:14 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: tools@linux.kernel.org
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: No longer need to pass current msd-id to "b4 diff -v foo bar"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konstantin,

I would like to suggest a slight improvement for viewing diffs across different revisions.

I think it would be better if b4 falls back to msd-id of the current topical branch, if any,

when no msg-id is passed as an argument.


Last but not least, thanks for b4! it's a marvel :)


Regards,

Amjad

