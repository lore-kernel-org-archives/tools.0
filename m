Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A119BB4
	for <tools@linux.kernel.org>; Thu, 31 Aug 2023 20:26:46 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-410ad0ae052so11065191cf.1
        for <tools@linux.kernel.org>; Thu, 31 Aug 2023 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693513605; x=1694118405; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ7ZYa/KLfKCFIbQePPtMA/rY+cy6+mqF1inUWhew5w=;
        b=dU3T5RoXfj1R+VKqXlbrhoxp/GdQc9NdIzoXMq1Q4+MS/TfD9rXkZNnO1guOZvZDoN
         reP2WZ+DER90Bh0nBqFsSepm2Wn6R9PUDncMh/NG98FPUei+P4U464Jd6ae70l64vvyU
         ylDk/9ffWVBLujj/UTDQeEifZLrJaf3Ey78Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693513605; x=1694118405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ7ZYa/KLfKCFIbQePPtMA/rY+cy6+mqF1inUWhew5w=;
        b=RaBnLR5fLr9iUiy2yNQ6PYrjtG30T8amS+et1Maevv6aMgw/+5KnJrZnPqZXhIYuGm
         9KIg7G0LTD69krVTjnqn7UsH5v0Ar5SjiQ5uTy0lJ29RxUqwadrLrxQt+ulFPoHasjEg
         BDrZSz6Vnxs14JQqL9JVgwLaDuZMW00Ymj2CE+ScchKAWd4bbME9G9J23ym995Q2wuu7
         VsJGtU/CteciIi2lD4Itt7NpQVkEau7WFZGzYAbCCJT7Ak4uxpvsnrJNMnKtRK3JASoc
         zY7pKAPl5lFiNZVlMMAg0Oj8F02x4o3u5N1eN0FXXvnzOwtveWvKbWQWAzhl1RaaM8Cy
         CB5g==
X-Gm-Message-State: AOJu0YxuLxzUCC8Z+xNuLbLKRHtxOZisgxB+dYlLJuKWW4LK/sVtlKVH
	1AUHfB4f2igSEYqG8jBpimkJ8g==
X-Google-Smtp-Source: AGHT+IHU8X3zPSOUICDXu08lRD4lRLJuk2mkynnppwwGwQeObpiy+g3cQVMK82OcQbZxL3j58YDLQg==
X-Received: by 2002:ac8:4e55:0:b0:3ff:2cce:c625 with SMTP id e21-20020ac84e55000000b003ff2ccec625mr4733048qtw.19.1693513605492;
        Thu, 31 Aug 2023 13:26:45 -0700 (PDT)
Received: from nitro.local ([204.48.79.90])
        by smtp.gmail.com with ESMTPSA id h3-20020ac85143000000b0040ff121e011sm889246qtn.2.2023.08.31.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 13:26:45 -0700 (PDT)
Date: Thu, 31 Aug 2023 16:26:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 patch corruption
Message-ID: <20230831-finale-hurrah-chai-2791dd@meerkat>
References: <c9643b70-8751-a2a2-185e-174ec2560328@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9643b70-8751-a2a2-185e-174ec2560328@citrix.com>

On Thu, Aug 17, 2023 at 01:23:06PM +0100, Andrew Cooper wrote:
> Hi,
> 
> I'm using b4 v0.12.3, and getting some kind of patch corruption issue:

Indeed, I can confirm the problem.

bugbot assign to me

> I can't spot any interesting differences between what failed and what
> `git format-patch` reproduced, but I'm out of my depth here.
> 
> My gut feeling is that something has been mangled while b4 was
> processing the change, but it's only a guess.

I'll have to dig deeper, but the main reason is that it's not a patch
generated with git (you can tell by the lack of diff --git and index lines).
However, b4 shouldn't corrupt such patches either, so I will have to figure
out what is throwing it off.

Thanks for the report.

-K
