Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274BAD21
	for <tools@linux.kernel.org>; Tue,  3 Jan 2023 22:52:19 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id c7so25781748qtw.8
        for <tools@linux.kernel.org>; Tue, 03 Jan 2023 14:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wYoefWN4yTNUfJGZNVN98xu5bZyl/gH9iuix/A0G6W4=;
        b=b987O9iiXG+Wra7amgnQAtKZ5KhPN+F1IiISi9zqmWWO6Lv9sIcXloT1r/1Pa3weNw
         xCQl+tzodlwB8/SCgAXwlR6lTUdtlTcFPOwH4ACaZuDkCrCSOdnQI9MZdhmWASiivxDL
         UKCGcoI8JjvhXiQtodzz+/iIWEpJSR4mkwaAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYoefWN4yTNUfJGZNVN98xu5bZyl/gH9iuix/A0G6W4=;
        b=5rWlqU6SoR0mZ+9+WGaf66cnoxDbx6c1ftsivVWETxjA3/lJSq5zEGGzanugy6P9lg
         /4OQpaYV1eZon8mCQt2dIly9hyb+hB4C/0+wJZRel/5Xh3DR4HNQ8mGsZqbVBgAUlIUR
         mTWncHaoRvgC4NnK7o2TDDy9Ovsjh3f7ZzsaGpn6Exy5M/i8xvlQVBmuRsqh+LzYJiVT
         0/FunMXVVxT2rMrHnU3vK1WAF4y5g0hZdbqKQkEgGjkJlVcav9Ns/pjfXPGuIh4vEx3T
         AX7Vdr1yxGApcnjrtYvIJe7xVVHJ5P0Ng1q3N/dg7t6VETFFG/BCyabsUeOfcgb/D1Vi
         jv7Q==
X-Gm-Message-State: AFqh2koTsojdk6sFqGPzirb+85SrQL7q/RkQM4u0fXC+h66kJXd+VrBi
	XnMY22Qh9jRfnZ+SpN8maZP/fkFaB927hHIO
X-Google-Smtp-Source: AMrXdXuDjfEkuhnUzSdoJNi1+jnwXrMnTD/+TXLd0tBDpVUAwtMsmtSiQ2y7UneVHYf9FUzAGu+lAg==
X-Received: by 2002:a05:622a:5c17:b0:3a8:2dba:751e with SMTP id gd23-20020a05622a5c1700b003a82dba751emr73095677qtb.26.1672786338583;
        Tue, 03 Jan 2023 14:52:18 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id h4-20020ac846c4000000b003a7fc70d59csm19548048qto.41.2023.01.03.14.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 14:52:18 -0800 (PST)
Date: Tue, 3 Jan 2023 17:52:16 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: Regression in b4 send since 0.11.0 when commit title length >=55
 <=62
Message-ID: <20230103225216.lb5kxeesqehegazz@meerkat.local>
References: <b79c49b3-5815-7100-e99c-440e1840b3f9@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b79c49b3-5815-7100-e99c-440e1840b3f9@theobroma-systems.com>

On Tue, Jan 03, 2023 at 01:25:00PM +0100, Quentin Schulz wrote:
> Hi,
> 
> I've recently updated from 0.10.x to 0.11.1 and have an issue with b4 send.
> 
> When a commit has a title of length comprised between 55 and 62 characters,
> the Subject header content in the eml file starts on the next line and makes
> git-send-email unhappy.

Thank you for the report. To be pedantic, this is a bug in git-send-email, but
I also find the fact that Python does that really annoying.

The latest commit in master and stable-0.11.y should restore the previous
behaviour.

-K
