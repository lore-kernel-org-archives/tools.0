Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2156117
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 11:18:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so4909575e9.1
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686914291; x=1689506291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rzzz9+MQDy1v7mf6h8LKh2I0EdtZCpgt3033bmxFLt4=;
        b=xO9S4qPH++KwL3bqmpqNIouOhxbgRJ6SxHNQK/ye2vn8zyZyyVWE0A8Fp12TPe5UEm
         auhGwcNjhXlWmq7Z/IdqpdZbQkKk8Dml+ZcRR44APMB4R0kI3zvQIXbdbpPDxieV8yy3
         YUN8nNjIG63V6OC1046j6gB2kYhjfS3Yi4uV54gq2eRTC7+ihj6Ja8OPu3PIWiKMjPjH
         G5wW5UmtxjC9eoDQvYkHUMmCLvuG6T8Ls2v1sidokHKLWLLYphoIclz567/lbDY8nQgm
         MC1xP36ucCdyTuIXwAZbqlb6aX3l8SyGtYlvJdvuYY239/r5sjTXPcmnRUVtUw6qLzH9
         u1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686914291; x=1689506291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzzz9+MQDy1v7mf6h8LKh2I0EdtZCpgt3033bmxFLt4=;
        b=H1sB6nflzE2V8lg2cQ0Chb9qnYZ6CLx0HNJ/X6G/HbrUHITCt+28PRGs9uHKgIg7AU
         wQhkq7cPtWPeEUqCI/nb8ghaIoq5aORM6GBuhbkwX5F39BGRKQf6nukHJKsAbjd8kjTA
         s7pZVI4Ir9ZjwwZZHhzmAmhdbi2jx/dwYQvYpJwwrge/EnFx9ZunhkT1nIZ5XPfC1QrL
         fCGQ3l3UCGkHwrhNCLK8sUIhFW+DpEA2Is0vy5mqFVgiNxB7Kl8JdlL3e6WnzB/HdODf
         RV0/xVgiayG0rbKh9QawD7d1a+7sbVugiZCMslIJyKcvtLbtpTWuHtPJ0iBQZH8QnQZJ
         9lCg==
X-Gm-Message-State: AC+VfDzk19gQBK8uON1yEgXHmlCk5LRr5Fikg4GhLxrC7+op7fLAqrjJ
	ZDJftfXBBdMOlSFT6Lm+M24K2w==
X-Google-Smtp-Source: ACHHUZ4dQlbHeAuRZeLC4Y8OzZsImTHLTf2rFlPkoywMcf0wXUYdWyJ5nI7ueJAs67y7U7OWDEJTlg==
X-Received: by 2002:a05:600c:329d:b0:3f6:eae:7417 with SMTP id t29-20020a05600c329d00b003f60eae7417mr6554134wmp.1.1686914291372;
        Fri, 16 Jun 2023 04:18:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n16-20020a7bc5d0000000b003f739a8bcc8sm1917075wmk.19.2023.06.16.04.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:18:09 -0700 (PDT)
Date: Fri, 16 Jun 2023 14:18:03 +0300
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
Message-ID: <7466cb8d-85d9-4583-af2c-3616209e97e3@moroto.mountain>
References: <20230615-topic-sm8550-upstream-fix-spi-geni-qcom-probe-v1-1-6da9bf2db4a4@linaro.org>
 <b82b8041-7bc5-433c-98bc-4ac6fcf5ae9d@kadam.mountain>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82b8041-7bc5-433c-98bc-4ac6fcf5ae9d@kadam.mountain>

On Thu, Jun 15, 2023 at 06:12:03PM +0300, Dan Carpenter wrote:
> Here is the command to search for all the KTODO items added
> in the last six months.
> 
> lei q https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'
> 

I guess you need the -I option here.  I'm not sure what -I does.  I had
thought it might mean case insensitive search but that's not it.

lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

regards,
dan carpenter

