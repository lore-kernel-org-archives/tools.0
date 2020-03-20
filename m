Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4732.1584724561537841026
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 10:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MVit7FPY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id b2so8422029wrj.10
        for <tools@linux.kernel.org>; Fri, 20 Mar 2020 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eor6OfupQxTu+1SaQqwNw8XrOHI5y2QhAiJZNnnkkNU=;
        b=MVit7FPYuayJZpgODqzIA9XoPgOBSJxpN80wezCfgAJ9RRuhSegAoA6z5nXQrEGPJ2
         6xVVrwjwcGG2c4MSCXIX6touAdduwAc/Cw5qbDk2JAMSy2vMi+vgRFeWd1promCGBEQv
         lypSt13/mG/MbNkptb80oChO0F5wBzqMo1etE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eor6OfupQxTu+1SaQqwNw8XrOHI5y2QhAiJZNnnkkNU=;
        b=n+xlJW0FANu2JQY3VkNI0zly4SyOiOYp6GJ9e9NjrPujLaeDdFtfEkq3w4z47VnHcL
         4gRy95F1ytfUQbOrBY0q3YOQRFv59Or+KdZoQcX4FmKlaWr4srtuSCm5ZsCoYtc/C9JV
         l6NCmC9+s3gUV5bw5jxgCv+TbRdKNR5Qqs2DS9b7YkWW6o6HndqEpgVIfACgeRjdeNZb
         W0WOf/BcegB+Ip9s3woamYwN7DIVz9YaceCa8/D1c6R+uItBitH2odWTX6uzZE9Cm+pK
         vS55SbOjo4D7GR7CPhSMGwR+Q0QIQKqlMpb2csZluSlEOCG2H5eR+jFN82mIDnx4LnGy
         oKOA==
X-Gm-Message-State: ANhLgQ1FehejZtTciZ65/QzG+g0JMvRq/AVNAGUzWJsGFtwTv5P9/nXs
	bxdDVsrd+ypR2UWp6qjlN+n5hw==
X-Google-Smtp-Source: ADFU+vv4G+0C7eyElpN2R1L0AG3rkYzOWh6PLcLJFWqO1BMYIGzgF+qBvkCaZTmljbZlc4kqrFhVWg==
X-Received: by 2002:adf:a387:: with SMTP id l7mr12221820wrb.250.1584724559999;
        Fri, 20 Mar 2020 10:15:59 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([185.220.101.136])
        by smtp.gmail.com with ESMTPSA id d21sm9014558wrb.51.2020.03.20.10.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 10:15:59 -0700 (PDT)
Date: Fri, 20 Mar 2020 13:15:53 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Geoff Levand <geoff@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Add b4-wrapper.sh script
Message-ID: <20200320171553.bepofsazcvrh5kvm@chatter.i7.local>
References: <28f6ed8d-9922-dfac-e3db-fd2768d249f3@infradead.org>
MIME-Version: 1.0
In-Reply-To: <28f6ed8d-9922-dfac-e3db-fd2768d249f3@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 19, 2020 at 08:34:28PM -0700, Geoff Levand wrote:
> Add the b4-wrapper.sh script that allows running
> b4 from a git working directory.

Thanks. I changed it slightly to just call it b4.sh and documented that 
you can set it up as an alias.

Best,
-K
