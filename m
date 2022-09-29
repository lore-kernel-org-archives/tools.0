Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429262579
	for <tools@linux.kernel.org>; Thu, 29 Sep 2022 15:05:48 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id de14so955239qvb.5
        for <tools@linux.kernel.org>; Thu, 29 Sep 2022 08:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=3MsvAh8EuomSUCyHcAQ3wfb2wHMqJUIrA0iSJ3V3AGM=;
        b=hSTbUNIssRo12LBqBq0WPU/eyCHzU9pqp9fhqnjcBjioBPnaDqH5lZg4pq/klh+Yoq
         ylBbJQ52tj4gpohNWA9fmuYwhWm6S/4AWc0SeELajlWNcVDqe3q/poEjRTADnkDr/WM5
         /EnUmiUjjz4F6R+RLApOqRrlm+GaZ4cGNji4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3MsvAh8EuomSUCyHcAQ3wfb2wHMqJUIrA0iSJ3V3AGM=;
        b=Irpwk/cD8tIAjrockZZK4PYkJEUJQph1BZohinkdhlJeeZeYnYijFZtsxiNW9MHQpA
         c6iIYospq9rydHljd1zdo3yxjTFR0bMfl/+0d7B/8Dfvpwg5hAVT6fVphShGM08Vjd9e
         F1HxZRnQTTy63mFHVPwuNYbDEKW7cDzeQRLtUorI663AII9hb0Fy3PfpiTbtS2SV0PFO
         3+AaucsIv6oya+i57xx2DFtw5eZyZ+TBlgbzQpYpt9fi4p3dGpPN77pqB8/uUFGd7wSV
         XrDTCzMeRjYAWofLpQVX2/8aFZe/OVNEyIl1RKgva405lFxrD4xkyTAf1/F+FeLhWsgU
         8KBg==
X-Gm-Message-State: ACrzQf2ib3Wb02hnlou7OwMNDbL+/rTnjt8wmMqb6o/Zp0pt5C5dD8Pv
	tgpdUMx/QwgR+KzOU7/oeVXe/CZmZeZLIw==
X-Google-Smtp-Source: AMsMyM7lZSlGtEy3/rOhkXQFF2zBq7ug0O5IbervDpkfvPgTf5Jjyxmpb8kSNDd8BBHftHYUex2nHg==
X-Received: by 2002:a05:6214:2a89:b0:4ac:8360:6c65 with SMTP id jr9-20020a0562142a8900b004ac83606c65mr2887324qvb.110.1664463947003;
        Thu, 29 Sep 2022 08:05:47 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id z8-20020ac87108000000b003445d06a622sm5673514qto.86.2022.09.29.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:05:46 -0700 (PDT)
Date: Thu, 29 Sep 2022 11:05:44 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 send crashes when sendemail from is missing
Message-ID: <20220929150544.47vywh3e3fwj3gw4@meerkat.local>
References: <eb5d38af-ed64-38fd-2515-e489120cbb0b@linaro.org>
 <20220928135617.ffe5gd23vr5f2lp7@meerkat.local>
 <85c182a4-0ecb-9983-26ac-235cd432afd7@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85c182a4-0ecb-9983-26ac-235cd432afd7@linaro.org>

On Thu, Sep 29, 2022 at 10:43:55AM +0200, Neil Armstrong wrote:
>   File "/home/narmstrong/.local/lib/python3.10/site-packages/patatt/__init__.py", line 366, in _sign_openpgp
>     raise SigningError('Running gpg failed', errors=err.decode().split('\n'))
> 
> patatt.SigningError: Running gpg failed

Can you run:

    git format-patch -1 --stdout | patatt -d sign 2>/tmp/debug

/tmp/debug should contain the command it's trying to run to PGP-sign things,
e.g. for me:

    Running gpg --batch --no-auto-key-retrieve --no-auto-check-trustdb -s -u B6C41CE35664996C!

That should help troubleshoot what's failing.

-K
