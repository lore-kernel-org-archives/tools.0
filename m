Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4828F3
	for <tools@linux.kernel.org>; Mon,  1 May 2023 15:36:45 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-74de9ce136cso114736585a.1
        for <tools@linux.kernel.org>; Mon, 01 May 2023 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682955404; x=1685547404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nwS3WoU0ckMhXsmcicgFgMs5sLzKP3mV/eAYcwWxFQM=;
        b=c5Vr+zY1BWMyMoW0XQqKO0Ia64iiC7/f3p85YQq6xtxQupYimnTGElHoARjb8PsPBL
         NbCpDjcygKRoWzQ3khvNU/t+fs+UPmnZvTG/wPL/uc80U+0/fAcNlYGYxVaY+PsQol50
         kRhL4QBMO8oARXfcqGrduAelAvBffVaVWklN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955404; x=1685547404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwS3WoU0ckMhXsmcicgFgMs5sLzKP3mV/eAYcwWxFQM=;
        b=XCvGbX23iSczDSLzutS5HqJ7yRxX+AMtWl3Ugec9gAE/RDxzlsUG0x2vVeN4QY1HmO
         1OffIYiFMxXfYIKcq+yai5bzuvQbM3Qmr9gVgPPwpwAQmow3ga0WvLdtj6ise+fFTm6K
         2H2vWitkQPxpk8lWZ7pORfFiXRIOtlPfuS0RSkbOC3IYhaEUQE0WLj/M4kcE3YjaOsOT
         bwT/abIJTQnqgoz4+ctxDpsuIOXGtkitTGR4zXWV2ovdm2yQksQCGQL7WNK/vCIZWuiJ
         b1J677jaU6nTXtTO+0h+h1W/kL1uEcqvuBFjOUpozhg9U++AbJTtVaOcT7hMT43BBPV5
         LfzA==
X-Gm-Message-State: AC+VfDypOznbMe3/eazZknuIQq8A9IOtUukdBBynyVXvq2MlEfX8lrjx
	EKfOegtBLz5eLI6swOYdbwCvKA==
X-Google-Smtp-Source: ACHHUZ5wScQOXjrB9UG54hL/GjOi0OmwOvQWTGT/JUN3Mfw+YHr2cHXyYdTrglUUS11YgjqDkbsLIg==
X-Received: by 2002:a05:622a:1c2:b0:3f2:ca6:1817 with SMTP id t2-20020a05622a01c200b003f20ca61817mr11371033qtw.50.1682955404207;
        Mon, 01 May 2023 08:36:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id he31-20020a05622a601f00b003e635f80e72sm9505598qtb.48.2023.05.01.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:36:43 -0700 (PDT)
Date: Mon, 1 May 2023 11:36:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	tools@linux.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Re: [ANNOUNCE] New script that finds partially-backported patchsets
Message-ID: <20230501-deskwork-imprison-fc8451@meerkat>
References: <20230430064948.GA36600@sol.localdomain>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230430064948.GA36600@sol.localdomain>

On Sat, Apr 29, 2023 at 11:49:48PM -0700, Eric Biggers wrote:
> - `find-orig-patch`: Finds the original patch email from a git commit.
>    It first checks for a matching "Message-Id:" or "Link:" from the git commit.
>    If that fails, it falls back to a search of https://lore.kernel.org by
>    commit title and uses some heuristics to try to find the right patch email.

You should also try matching by patch-id. E.g., taking the commit from the
example:

    $ git show de534c1cb031 | git patch-id --stable
    7d23fb78b4bb892155827a612631168cb28584cc de534c1cb0313a070f45938a53b53927cd34e5b9

Then we can search by patchid:7d23fb78b4bb892155827a612631168cb28584cc:

    https://lore.kernel.org/all/?q=patchid%3A7d23fb78b4bb892155827a612631168cb28584cc

-K
