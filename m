Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0520F2
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 09:53:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id ay40so12791937wmb.2
        for <tools@linux.kernel.org>; Thu, 12 Jan 2023 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:subject:from:reply-to:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaiVa6umOgDTQCuT1BpTp2CbxZx7pCJTA3RX3XzFCyM=;
        b=MsSliB8i6VePSHjfIZx2ZlqDlrE+MxZsAWKwGsVqg3SAbmDu9zxYvZn8vZgKSLQBgn
         MXSb/5OhX3JDO8HO/1fAQvh6ypdLmjscqSxkk34nw4ppRgM24yOZOjp4RcdPyPQl1PdB
         0EXbttREL7iPtBqHX68F4FPJmvUAljS/lsfYEgl1PoWX/9KvE/wAR2SrKMcR2/uh6DIe
         T45IJ1HRsgWOF9/Aj6ix0cBMYlfACpIDu5NLUf/qj2sKCszGoY1M+g4ZOJKHQ5O7LlLS
         TWQyLI/Rc+tqMIYHKviU4PMLPMePJxbZ6woZ1i/VQk5JMGtAYtl1zS7Rd+12hXaxivBu
         J/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:subject:from:reply-to:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaiVa6umOgDTQCuT1BpTp2CbxZx7pCJTA3RX3XzFCyM=;
        b=rcA4sJmu4gb4QxtgmEcmevVd8mtZIvP9AhKRdAOPuCxMUnIU6sC2dyP4DTPlRTkHzM
         jM2qGBKLOONtS9kSHg2hzDNYMhnA+NnG3e+9HE9cN5Zb9osc2bItyO6q94maNaBRhyNq
         L+s4G8xF5Fxa9JfOujFXNOYfylNeG/pEdNaH6iTn+wM5+34GS2YO7hnlRZuQTIuOJLac
         CPsK7gVaQWcHVkdjiVzoeiGMqsYaAxmPzFs6eoR3Axm9N4nFw+8XoUOg+h8CJ99rnsA2
         j/H1mD+b0AHNs3CyEjRCgVwJOuWprxcPKR/4fp+u202dEWO18jTEO3bEOOpzk/RACD4B
         PDCQ==
X-Gm-Message-State: AFqh2kqJcdlrMYDfdnc+69QJUJmOyC651zuYsU3iWihhQtyLl7hPqVA/
	9wKRAPhbOYGENubisFNxIA7fPjcZxhlBrcwB
X-Google-Smtp-Source: AMrXdXt+90+eewIu8EPJK7d6jNAMwJy2H/5CEJn5wyRL9mqD6xDaEnnTAr7hY+Qn6iVlf+aWgPUTYA==
X-Received: by 2002:a05:600c:601e:b0:3d4:a1ba:a971 with SMTP id az30-20020a05600c601e00b003d4a1baa971mr54840257wmb.24.1673517237982;
        Thu, 12 Jan 2023 01:53:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id he5-20020a05600c540500b003d9ed40a512sm17777817wmb.45.2023.01.12.01.53.57
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:53:57 -0800 (PST)
Message-ID: <6b4dc5aa-15a8-438c-ac53-1de49ec95c71@linaro.org>
Date: Thu, 12 Jan 2023 10:53:56 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
Content-Language: en-US
To: tools@linux.kernel.org
Reply-To: neil.armstrong@linaro.org
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Message-ID length limit !
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi,

It seems I'm hitting a message-id length limit when sending with b4, here's a 2 patches thread:

0/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org/
1/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org/
2/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org/

Neither lore or thunderbird shows the thread correctly, so it seems the message-id is too long, right ?

And trying to apply the thread with b4 fails :
$ b4 am 20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org
Grabbing thread from lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f%40linaro.org/t.mbox.gz
Analyzing 1 messages in the thread
No patches found.

$ b4 am 20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org
Grabbing thread from lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f%40linaro.org/t.mbox.gz
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2 1/2] arm64: defconfig: enable SM8550 DISPCC clock driver
     ✓ Signed: DKIM/linaro.org
   ERROR: missing [2/2]!
---
Total patches: 1
---
WARNING: Thread incomplete!
  Link: https://lore.kernel.org/r/20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org
  Base: not specified
        git am ./v2_20230112_neil_armstrong_arm64_defconfig_enable_sm8550_dispcc_clock_driver.mbx


$ b4 am 20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org
Grabbing thread from lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f%40linaro.org/t.mbox.gz
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ERROR: missing [1/2]!
   ✓ [PATCH v2 2/2] arm64: defconfig: enable Visionox VTDR6130 DSI Panel driver
     ✓ Signed: DKIM/linaro.org
---
Total patches: 1
---
WARNING: Thread incomplete!
  Link: https://lore.kernel.org/r/20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org
  Base: not specified
        git am ./v2_20230112_neil_armstrong_arm64_defconfig_enable_visionox_vtdr6130_dsi_panel_driver.mbx


I'm running:
$ b4 --version
0.11.1

Thanks,
Neil

-- 
Neil Armstrong <neil.armstrong@linaro.org>
Senior Software Engineer - Linaro Developer Services
https://linaro.org/services
