Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20B7BA31
	for <tools@linux.kernel.org>; Wed,  4 Jan 2023 19:50:05 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id j16so28127347qtv.4
        for <tools@linux.kernel.org>; Wed, 04 Jan 2023 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jPmPe+VVF06m/EAaTc8aLyuuJlHYBU/bWlE3llmglXQ=;
        b=NUJNBtO3aT/RXGYEU9ksthtSWdmajPL8/flUMbD32O96l0vFDzD/at3fGIqZQaPvzk
         J7K4pmgjLyPGZB0bax0pZ2KJ871AN8Pfs88+JVgB4YnCZfNaRwJ7A2OZrxq1uSSNVZRe
         IWHvWRyGXc4Z1bkn+cmvst1xX5oq+wWQnKNvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPmPe+VVF06m/EAaTc8aLyuuJlHYBU/bWlE3llmglXQ=;
        b=ZdsCJyB1EvrX/IOTYCZ0PWEFBBcWvkvKseqJx9a0aT9sqxkpK7ha6SmUqPaTAmT+N7
         0o/toysHBda8DldMVn1auFC75uhujauNsMKL2Wlx5e1X77EG3HkmhMeUhZERGo1d5c/w
         RTcNjOULvJh8Ctm/uobVaq92FefgzYsbS8ko8XfANgUQyqg//9b81LAARxQj2zYcxDo1
         NX7VRTTVDJk2Ut54MyBriIbdTxgJEAfEH6R5HeGwajZNBEFb6Ioynug69v+GOYKJA5Th
         TtovLMU+XySXUiRO2LxrKL+2oxn2nAT+ejGMh8bXuhLBhx3CjoLZJptBNNH1GakbB7nc
         o++w==
X-Gm-Message-State: AFqh2kpQZo8L5xHv69ESJC8ItViYpHSXjaNzHJ/Q/HrM/Bol8ylyZpEE
	3+CH1LIR9quIRafVf4L4yjERv1G3YXEnaZmi
X-Google-Smtp-Source: AMrXdXsKpWutEVnik5Ylo3KutbnRnI+P2pjdpXbNbTaitwlPGRhR6piwuQhKik8YKw7YsubgmJunmg==
X-Received: by 2002:a05:622a:4d98:b0:3a5:24ac:a175 with SMTP id ff24-20020a05622a4d9800b003a524aca175mr73558030qtb.56.1672861804628;
        Wed, 04 Jan 2023 11:50:04 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id d18-20020ac85452000000b003a7e8ab2972sm20557648qtq.23.2023.01.04.11.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 11:50:04 -0800 (PST)
Date: Wed, 4 Jan 2023 14:50:02 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep --show-info for non-current branch
Message-ID: <20230104195002.xe5fm6nvq5ors3rq@meerkat.local>
References: <Y6sm7iI/mOA8/p4H@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6sm7iI/mOA8/p4H@sirena.org.uk>

On Tue, Dec 27, 2022 at 05:10:06PM +0000, Mark Brown wrote:
> Hi Konstantin,
> 
> I'm now using b4 prep --show-info in my scripting.  Something that would
> be really useful would be being able to pass in a branch name to query
> information from, so I can do things like push serieses through my CI
> without actually having to be on the branch.

I poked at it a bit, but doing it properly will require a bit of refactoring,
because a lot of internal commands will need to be modified. In general, I'm
probably going to make this a larger effort -- some commands already accept
--gitdir and --branch parameters (e.g. b4 ty), so it makes sense to make these
flags understood globally instead of per-command. 

Once that work is done, you should be able to run something like:

    b4 [-g path/to/somerepo] [-b b4/some-branch] prep --show-info

-K
