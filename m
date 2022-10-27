Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C771C27
	for <tools@linux.kernel.org>; Thu, 27 Oct 2022 19:39:01 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id c8so2331047qvn.10
        for <tools@linux.kernel.org>; Thu, 27 Oct 2022 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=di5Bm19oQf6oYkttQqnG7QuW4JHpZkWMF+yq/wKBjz8=;
        b=fA5/T2lYj9uL/+DQ1dS14fBwdvsRVMxeTN5BqpmbriKz+Zr5wkDAB/UHfq8lQqmal8
         +BS347WCwbAY1hwK74Ct+1CiKp0YVdYBtDGQiy8Ygy+YXlrQaGqENqknzqyL7bqXzznh
         dOC9OjVlck5vLFK0QGorL1tzmQF4QkzdBiH+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di5Bm19oQf6oYkttQqnG7QuW4JHpZkWMF+yq/wKBjz8=;
        b=ExVATBxUbMTfzTbE6SNEUXuQuTdi2W3e39HMKzfikV+SOLygGuauPtiuXFTkVO8dPb
         IVhMjTT3Nlc/Rqx+1SOiaZMAldlvQVyNKP7+0VIEH4i70zxRXF3yeqah09KYq7D9xhgs
         9DQLt7Kef5OzPUfw0qJEusENfQ/qAQtzN6yw6uFzdoHVpdNsXRcjXOA31qbFyYdnKHt/
         KXiaXtpr0AVG407lN7oRa6SDW5jrGDgeYzzi99T07bwFJIYEPRcKIBjl1hLuo/WTxdJU
         BLsj3GQZNDPIv7R1o1JC0cpl68HuxwErlbGFx9xqRAhxNIJY0mhgjmeysTbQ8yEKWqv0
         EF5Q==
X-Gm-Message-State: ACrzQf18UZhQ3oOfQu/nTLUydYm7NyGmn9bbj6FoSS7mcHrenZmWE0S/
	c8wwJtu41GVWSIOpJagZRgq43g==
X-Google-Smtp-Source: AMsMyM4cDMQ18sXLiW9LFu/rU3wEP1cUmkCZScYtly/VIQGQ9KHTbIgX5GpWi9yuj6uiSV3IpR+vqA==
X-Received: by 2002:a05:6214:d06:b0:4b3:f2ea:f67c with SMTP id 6-20020a0562140d0600b004b3f2eaf67cmr42904953qvh.84.1666899540452;
        Thu, 27 Oct 2022 12:39:00 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id k10-20020a05620a414a00b006be8713f742sm1581680qko.38.2022.10.27.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:39:00 -0700 (PDT)
Date: Thu, 27 Oct 2022 15:38:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 v0.10.1 is available
Message-ID: <20221027193858.uoifoamajszkqhdi@meerkat.local>
References: <20220926172903.f3mudqmts5woudll@meerkat.local>
 <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJVY5Mk0e+wLXQBJnY0OwR=vh24MhqTqmaozBjaBAULKQ@mail.gmail.com>

On Tue, Oct 04, 2022 at 02:03:08PM -0500, Rob Herring wrote:
> I found a couple of issues with trailers and send. I'm on the current master.
> 
> In 'b4 trailers', if the patch id doesn't match exactly and it finds
> some trailers, b4 just prints 'No trailer updates found.' which is
> misleading. Can it have a fallback to subject matching or at least
> print when there isn't an exact match and list the trailers found.
> It's quite common to either have minor changes (and a judgement call
> on whether tags still apply) or a review that's 'With X fixed,
> Reviewed-by: ...".
> 
> The 2nd issue is with 'b4 send' and seems to have been introduced
> recently. I have a commit msg like this:
> "
> Some commit
> 
> Signed-off-by: ...
> ---
>  v2: https://lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/
>    - Rework YACC code to handle configN formats in C code
>    - Add a warning when an unknown configN attr is found
> "
> 
> I'm putting '---' in the commit to store the changes for the commit.
> The patch ends up with 2 '---' lines, but git drops everything after
> the first one. The issue is that
> '//lore.kernel.org/all/20220909204509.2169512-1-robh@kernel.org/' is
> added to the Cc list.

Thank you for your report. Both of these should be now fixed in the latest
master and stable-0.10.y.

-K
