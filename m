Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.9366.1610031447665214152
 for <tools@linux.kernel.org>;
 Thu, 07 Jan 2021 06:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=es6hEHpu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.45, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f45.google.com with SMTP id az16so2843902qvb.5
        for <tools@linux.kernel.org>; Thu, 07 Jan 2021 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LQiqsCoHFv62jo5AxrWzyXq0MD1oiAV1z9GB629Eaq8=;
        b=es6hEHpuo84d28G2dgxvw4/AQw+V46P3byJLlDPAWpKfZ6iNuSaihtLt9W+Eo4Uu4D
         7+bY//qFioxpNKegdPygBO+VzbgcTIsp3MpzuZgOLKo8/8KlkN1RzyPcWEHYVgrTCXnW
         3kMTzeBevT/W+j3drQ0iIaWA0BUf5eAdObxTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LQiqsCoHFv62jo5AxrWzyXq0MD1oiAV1z9GB629Eaq8=;
        b=Tc3007VGoDv5GhpsajD6fxNyWZpnAjKFpnWw0iQzKFW7gNRH+w4B0vFicorJGQY+hy
         IAB6t1Yk6/DxR2+eJ+MMLnAOV54cSj0spaJbAzyKf7b+UvSg8Zouzt83UH0xa0TOvvHq
         Kx1k/Bb2SDGMGD0ilEt0c+VOr21WY4bx2qGSNvsVk0Ybnn4bJXw5TERljBgQ9XC6kWOH
         e+JGI98LPE211jOXUbCbaaWLqWRf1SrK6h89O6HL9AKy7hvIwqDgiTEiQn1zhfTmSZNu
         VL4Q/wPTP91pOhom2WhTEAWrrzztIaIcbW88RfmwzQk1B0R+MY2vO5u3/EMf3EoiGyk7
         8PPw==
X-Gm-Message-State: AOAM531lDFPmo1qrLQHTxc1pQ6QEfiI9tb0rZNOtRWdDyW7Wzs//87/M
	8Ctmwo1POel7rsAlzw7A/A4MVA==
X-Google-Smtp-Source: ABdhPJyBBLAIOFIyHjn52qufLSkRxN3IOCallHU8kJT0rQe5QlnlrsyNy82SGQ8wfwlXpCj+Xlt7lA==
X-Received: by 2002:ad4:568a:: with SMTP id bc10mr8900461qvb.29.1610031446737;
        Thu, 07 Jan 2021 06:57:26 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q27sm3108119qkj.131.2021.01.07.06.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 06:57:25 -0800 (PST)
Date: Thu, 7 Jan 2021 09:57:23 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] b4 can't import message with '$' in message-id
Message-ID: <20210107145723.ma47zcem3dihxaef@chatter.i7.local>
References: <1dd0249a-d3bd-dd43-f4f4-f59a6a096c7e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1dd0249a-d3bd-dd43-f4f4-f59a6a096c7e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 07, 2021 at 09:20:07AM -0500, Philippe Blain wrote:
> Hi Konstantin,
> 
> It seems b4 0.6.2 can't import a message for which the message-id contains '$':
> 
> $ b4 mbox -o- https://lore.kernel.org/git/002601d6e480$c193bd00$44bb3700$@nexbridge.com/

Your shell is the culprit here -- try putting the URL in quotes.

$ b4 mbox -o- 'https://lore.kernel.org/git/002601d6e480$c193bd00$44bb3700$@nexbridge.com/'

-K
