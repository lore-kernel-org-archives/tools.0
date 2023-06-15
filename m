Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA812B94
	for <tools@linux.kernel.org>; Thu, 15 Jun 2023 15:12:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b216so19306635e9.1
        for <tools@linux.kernel.org>; Thu, 15 Jun 2023 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686841929; x=1689433929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZ87BWNtcPkV4Gczivg6cLrPcAb7LiiC1vsS1lqxHKE=;
        b=bEJEQmLPNS6jv1pDiwq9Swd5neLMqJKvqBKPHRhrtuQFrygutLLqbGVNaHRw05DNEa
         l9sUxm3zITfUTim6c6mfRW3aDciMwjdkgGrMy7GEiQuxjsinCZljWM79htVcpuDdqIOO
         WWXJTvLwvistu8A312DH5sd2Gyk1Ox8cY59d1/5bcFlt3ladr3JauT3MLrao3AiG0CLJ
         8UQZOPX6IhmHNWAOn6OIHmQKHt8gftlk1QjLkY3Af/Uo7UmaE/XzsmfmIp0etGLJtqMd
         W9O6zqApzPUjLe3Z4KEU7sdEO03f8LLk3fagtKHbDZnKBQ5gLHuBcrUImn3khxWTZzWL
         GyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841929; x=1689433929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ87BWNtcPkV4Gczivg6cLrPcAb7LiiC1vsS1lqxHKE=;
        b=YWRGrPkKdq6A4LwurInuarNF2/jLQ4rhwwSdobb5Pe/EVghkQLCsU58Q3NADh9ndTt
         YqSkJYqEaIvFGtIIwZEEwtfaLVKvp5r5KtPpRhsR4looqkaFJ9SjPNNNNBwB4UaxF/X2
         XPGp/k3BCanfmLK/wz9qpkPvN+tQc3IX6PW2Su5FFFcTO6cQ+dCSN4zP48oBJ1gfiNGH
         y0uiqwxAWeGOEobhrkobs7Aee/vLX1MsZDtGuDGN1qIYazBQ7JRl6zTUMA/tMkW3JoQJ
         LPA/76HsaCXTLU6T6F76ko9578EbFLlXyCVuK4jHXxHtEz3U3xOkEvuEE3NGExcHPkcC
         kNdg==
X-Gm-Message-State: AC+VfDyLnFopntibLafvnbOSd8hCz4oseAlvr6Z85UB93niiatdPiLb0
	l3lygIsZPMtkflSFkPfO76ZtSw==
X-Google-Smtp-Source: ACHHUZ5B65DF9SMw60tWVyffZ3UXoFkEt7gq3lAqCTZijt/HrXFu6D2r++Kqq74iar8TLy2Twe1c+Q==
X-Received: by 2002:a1c:7713:0:b0:3f6:2a6:e2c with SMTP id t19-20020a1c7713000000b003f602a60e2cmr13461411wmi.9.1686841928922;
        Thu, 15 Jun 2023 08:12:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003f7eeec829asm20792006wmi.10.2023.06.15.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:12:07 -0700 (PDT)
Date: Thu, 15 Jun 2023 18:12:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, tools@linux.kernel.org,
	kernel-janitors@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Dan Carpenter <error27@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	smatch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] spi: spi-geni-qcom: correctly handle -EPROBE_DEFER from
 dma_request_chan()
Message-ID: <b82b8041-7bc5-433c-98bc-4ac6fcf5ae9d@kadam.mountain>
References: <20230615-topic-sm8550-upstream-fix-spi-geni-qcom-probe-v1-1-6da9bf2db4a4@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615-topic-sm8550-upstream-fix-spi-geni-qcom-probe-v1-1-6da9bf2db4a4@linaro.org>

Added the kernel-janitors mailing list to the CC.

On Thu, Jun 15, 2023 at 11:23:17AM +0200, Neil Armstrong wrote:
> Now spi_geni_grab_gpi_chan() errors are correctly reported, the
> -EPROBE_DEFER error should be returned from probe in case the
> GPI dma driver is built as module and/or not probed yet.
> 
> Fixes: b59c122484ec ("spi: spi-geni-qcom: Add support for GPI dma")
> Fixes: 6532582c353f ("spi: spi-geni-qcom: fix error handling in spi_geni_grab_gpi_chan()")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

In olden days the kernel janitors list used to have a TODO list of
random tasks that a newbie could take on.  People loved the idea of a
TODO list but no one ever maintained it so in practice it was useless
after the first year.  I've create a new KTODO tag so we can
automatically create KTODO lists.  The idea is you write a one line
summary that starts with KTODO and the subsystem prefix like so:

KTODO: static analysis: Ensure that -EPROBE_DEFER is always propogated

Then people can use lei[1] to search for the tag and get the latest
TODO list.  Here is the command to search for all the KTODO items added
in the last six months.

lei q https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

The KTODO entry should have a short summary.  People can download thread
for more context if they want.  Here is the short summary:

The -EPROBE_DEFER error code is special and needs to propogated to the
callers.  If you have code like:

	err = returns_eprobe_defer();
	if (err)
		return -EINVAL;

Then that is a bug because it's returning -EINVAL instead return err;
Use static analysis to prevent this.

regards,
dan carpenter

[1] https://lpc.events/event/11/contributions/983/attachments/759/1421/Doing%20more%20with%20lore%20and%20b4.pdf

