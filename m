Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4468EA950
	for <tools@linux.kernel.org>; Thu, 19 Jan 2023 17:48:08 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a25so2129991qto.10
        for <tools@linux.kernel.org>; Thu, 19 Jan 2023 09:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXfgj9+JfA0+ObibkqIxMyN/meE7xRQU9r91cBgQmHA=;
        b=K9Ayc6Hxp29ZC/79No9h7qRS1ehikoczrH1ZBOJNC8vWI3ep15bfi46g8daHTpTC/K
         LHv6eiHYEmvIEnvf+eXmIerUadc7eDK+M80+7RsUo9vlPSi2b9wAThd9Ak1tqUz2/Lla
         ZrWKAyUfgxZ0XU/dzZM/IrxZfDauw91xvBYzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXfgj9+JfA0+ObibkqIxMyN/meE7xRQU9r91cBgQmHA=;
        b=ttHtlhg7vOrwJmynRXCyAP8UsUufsw8SvJQNTvRHkp6xNcxndw/s1/tyUCuJYhDpEx
         6j8Bhij10FdIYC16xpFN0sAOMmMr801+MbO43U7+ElPjycqRDVSKcVs9Q9Jupd//e2Gj
         KNMtiTV/QP9fk0tHg/hHHuH3X04G4+khc2jRemWjUxi8MbtVqVmZp5QltEB8qywx/Sj/
         qj+dFfJsMJnV4ItNmCYDMsh5qX1CJTpPga0W1fzVErYI2VHC/0zzIZPsdCPQaMFbbKa9
         D2hgLQ1b39M/21M1q0SSYKF3WvfrgK2MPEFuy8kmRr6LlkppJCuwy5uI4iibJqNXtE8/
         vwoA==
X-Gm-Message-State: AFqh2krtiamtMN8VNPzSQitfGIxaU9a5UjNcgHwaZHyEebjt4RO4+gZI
	dR7A+DbPhRoqLahWKYL3+bn2a/L2QTqWW/a+
X-Google-Smtp-Source: AMrXdXswbkrzNedvttPfdIQ+uBKhyDRCDXTm0nn4rWvqzCr7uZG+X5fCcWRFtjqOLaTZjte+IkNydA==
X-Received: by 2002:ac8:6ec9:0:b0:3b6:369a:3624 with SMTP id f9-20020ac86ec9000000b003b6369a3624mr16596878qtv.10.1674150487109;
        Thu, 19 Jan 2023 09:48:07 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id t20-20020ac865d4000000b003ab7aee56a0sm2825246qto.39.2023.01.19.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:48:06 -0800 (PST)
Date: Thu, 19 Jan 2023 12:48:05 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ira Weiny <ira.weiny@intel.com>
Cc: tools@linux.kernel.org, Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: b4 send patch order
Message-ID: <20230119174805.zz3urz5gfwj6mkre@meerkat.local>
References: <Y8dqN1DgZ6Fwbk6H@iweiny-desk3>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8dqN1DgZ6Fwbk6H@iweiny-desk3>

On Tue, Jan 17, 2023 at 07:40:39PM -0800, Ira Weiny wrote:
> Konstantin,
> 
> When using 'b4 send' what sets the 'Date: ' tag in the emails?
> 
> Dan and I discovered that this thread:
> 
> https://lore.kernel.org/all/20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com/
> 
> Seems to have a 0/8 email which is dated many seconds after 1/8.
> 
> 	20:24:53 vs 20:24:31

I don't actually know how this happened. I did find a small bug in how we do
this, but it caused the cover letter to have the same Date as the first patch,
when the intent is to have every consecutive message in the series to
increment by 1 second.

Even in the 0.11.0 version that was used to send that series, the Date: header
was generated using the same "series timestamp", so I don't have an
explanation how the Date: header in the cover letter was so many seconds after
the first patch.

- https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1118
- https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1135
- https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1178
- https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/b4/ez.py?h=v0.11.0#n1012

So, it's a mystery, unfortunately!

-K
