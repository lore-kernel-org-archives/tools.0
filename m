Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C6399
	for <tools@linux.kernel.org>; Sat,  7 Jan 2023 00:21:12 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-4c24993965eso36607587b3.12
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 16:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6kYnKcsACMCHOmjpHZh0Gl/kuqZ50JfO50oVbU+rf4=;
        b=Yg1Skr14YPkZ69JAZGSggCNLYhvtAy9+DD8SqOI5eVVhQji+yMFGyl4izyKgfPjh10
         qyQkIiTEcN1glK3A9wZ3LJK+EdaeHM9F8SyyHytRvMzMMyoHDdCCQghruvfuklTxIFV1
         SpU6NV/tRErW2tUIOcMB+H0GM5/NU/9/yCmZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6kYnKcsACMCHOmjpHZh0Gl/kuqZ50JfO50oVbU+rf4=;
        b=OS3N2SVDzWbk9QrLFoW0UKK/a+F5zXSP5CLFyLA2ODX+mmQjObaqIf/X68Pm+WznIq
         pJHgQ6YpjpcEW8SHr8lfwcY3nmjR4k50j7SQl0NrgvTZviznGiM3XqFUuIe2qUNqJ6Dr
         Q5QGPuHGMJ8tWW4iPhV35UJKxgL7tGQpL4o0HHC8MWypBKXThGAEy9fGrpfWsjLi04NN
         sAAVNVK4YY2nlHzJcT4WjF4S5Wsdqme2hDiTsYFaqzjPsTxLPf8P/GVvUfsr1zlDql0v
         lTK73lrw37rS2felc1dzuSoxW2V9S6s9wVyi28ol5CS6arSQ7bZtYctvVuJW5PoEL3eu
         ggew==
X-Gm-Message-State: AFqh2kpA7RJmiYfLqgUWoreiucolttLb+Cp35uaqmODKqPKONgBn0FQR
	Y1P8n3D3J5kismMGacDNRz4IG98TPcJ0Nmaw
X-Google-Smtp-Source: AMrXdXsbnGrQuRhq7t4lll0yzDsGMAYDFZoVlQlCJ2HKy0xhePTiRQGxdACUZgnIB/tW7U1sjYnc/w==
X-Received: by 2002:ac8:70d0:0:b0:3a5:1ea1:bae2 with SMTP id g16-20020ac870d0000000b003a51ea1bae2mr79806142qtp.34.1673050376807;
        Fri, 06 Jan 2023 16:12:56 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id b3-20020ac86bc3000000b003ab7aee56a0sm1200155qtt.39.2023.01.06.16.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 16:12:56 -0800 (PST)
Date: Fri, 6 Jan 2023 19:12:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <20230107001254.g6n5szh7cnkybng2@meerkat.local>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
 <20230106163442.aziaoa3tndqtyisp@meerkat.local>
 <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>
 <20230106192018.ho5yfvj5xirh3ugy@meerkat.local>
 <Y7h5/xItaBke0WbE@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7h5/xItaBke0WbE@dev-arch.thelio-3990X>

On Fri, Jan 06, 2023 at 12:43:59PM -0700, Nathan Chancellor wrote:
> Yes, I think the 'send' change sounds completely reasonable!
> 
> I do not use 'b4 prep --auto-to-cc' since I already have my own
> 'get_maintainer.pl' workflow so I cannot really comment on how much of a
> change that suggestion would be. I could imagine a Suggested-by: from a
> maintainer on one patch in a series is not uncommon, which would mean
> their Cc: would not be added to the cover letter with your suggested
> change, meaning they might miss the whole series. That would not be good
> but I am not sure if that is just paranoia or a real problem.

Okay, this change is in master. I'll probably backport it to 0.11.y based on
testing feedback. Please give it a whirl.

-K
