Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.39512.1606155470320248327
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 10:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dy07/J+l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.172, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f172.google.com with SMTP id l2so17925567qkf.0
        for <tools@linux.kernel.org>; Mon, 23 Nov 2020 10:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C3T/rNtlgTvKOwRgFI89LCpNfy+YtPzQnxlmuxetWoU=;
        b=dy07/J+lTkr53WnzMd156o3alpk8iY26xzxSv5C49b9q5wiQrbp1g+x0bc03oEGO5u
         t1Xc/DYaV7iZmE+iUUF/Czp1S1NYiZ+E6oxP7wWqUqzTS4DeElDo4S3/8HBsRoxG+ZlI
         TWD+MwDGC7EVWVVw7c1tx0hrKA9SeDEcX5CFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C3T/rNtlgTvKOwRgFI89LCpNfy+YtPzQnxlmuxetWoU=;
        b=c3GfHmALuulhc5fBzAYPBSJy4BJlVa4mxzrphO6WuNB4HjNldTxdAzs4Qc7PDQk5rP
         hCVEyhncJl8uDcJYybq2UNkyWNBvoH9/BSAPoJO5y3RFu69qTx8E/XOqIbqsn531S1c2
         RSaPK6zR49xDMtVE78u8K8kp3OtQ6YTNgkVBDAzi86ckgSImQhB7uGGlRBtk775B9KN2
         Nyvz1uBheSVTTy9XEGkAXtFL5GgtDNFPsxUwZDtFa06tYzUHqRVhV8wk6dSeSz52zi7J
         lmRZq8nticZ40K/L5+VzbVPoE+4+0RNNNu6anPZvgHFYyHBteH0Hy5nJr40Rsj79i9Uz
         8hrw==
X-Gm-Message-State: AOAM531i3rFLi3RnVo5L/mdr5j+9xd1vT2e/woRxMed3U+6pqnZXa2Am
	y1N2JEWuotVDVSXANolWtw3Hxg==
X-Google-Smtp-Source: ABdhPJywQVKPDAll1G2pdoSDRf0OywYHy56AQ0rMu0Ho6s9BaEMlL/vJvdBtXN56LMH+4ISk/O9rsA==
X-Received: by 2002:ae9:dd44:: with SMTP id r65mr766213qkf.482.1606155468852;
        Mon, 23 Nov 2020 10:17:48 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k15sm9901341qke.75.2020.11.23.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:17:48 -0800 (PST)
Date: Mon, 23 Nov 2020 13:17:46 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4: DKIM verification available
Message-ID: <20201123181746.fu32rqyw3bpohciz@chatter.i7.local>
References: <20201120221530.mfwn72nr6lqr2qqs@chatter.i7.local>
 <20201123154841.GU244516@ziepe.ca>
 <1dccb9ac431b854ba4f7a72f6e7b90baecdacbe1.camel@HansenPartnership.com>
 <20201123164220.GW244516@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20201123164220.GW244516@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 23, 2020 at 12:42:20PM -0400, Jason Gunthorpe wrote:
> Konstantin: This seems like a few bad behaviors here.. Shouldn't the
> first one report the DKIM failure??

Yeah, but I try not to put in features that everyone would immediately 
turn off due to high false-positive rates. :) We treat a successful DKIM 
verification as a nice surprise and quietly move on otherwise.

> It also feels like b4 should try other list archives if the DKIM is
> bad. eg inspect the to/cc headers and pick a vger list if available.

There is a better solution that should become available in the future 
releases of public-inbox:

- it'll allow us to combine threads from multiple lists
- when multiple sources match, we'll be able to assign a "weighting" 
  metric that should let us pick vger lists over mailman lists when the 
  same message exists on both

-K
