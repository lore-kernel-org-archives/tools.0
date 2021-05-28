Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2672FB1
	for <tools@linux.kernel.org>; Fri, 28 May 2021 20:47:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D83D60200
	for <tools@linux.kernel.org>; Fri, 28 May 2021 20:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622234827;
	bh=g3vZvCB+4HJABEVx1a4HEV9zuSou6/l3vyGBpPq6GTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eRQTQM+LFWHD7UuvSAFioSWvL/sKk92isnPvBA7NFCe4erQoolShLt1KIt2djSBSo
	 1rPesOQIf8GJObyzpWxWzpkR1X/r3CveUDo6D3gFj/85qIWfdKt67F3sPVpY3kBZKw
	 aThEU89gtqAjRDyCxTvEbLH3BsHvGC0JHst7DQnAuAdHkX7GomcTdSZGcGc/KH6wEC
	 k0LJp9D2v1+wfOaxMZriLXEn5khzcVbH2Fj5CbDjqLa+tIgHVKFoT5T0UaW2dHvxSv
	 brRhRmRiTrZBkT21zWKreZw8OgxvqjscPqZyATWOaUpc0rZNSLlxgE+Hp2lbOhcMA3
	 cm62yxWYa+KeQ==
Received: by mail-qv1-f47.google.com with SMTP id z1so2581414qvo.4
        for <tools@linux.kernel.org>; Fri, 28 May 2021 13:47:07 -0700 (PDT)
X-Gm-Message-State: AOAM5316NbKRwlfaxwqt2l15dyXPFfIzgC3UzsAJcgSI3KtKhWrqYE8w
	QpwzLQwxfEZLXLJ2Opu7utmzhTBBVdzfkVOmaqs=
X-Google-Smtp-Source: ABdhPJyvV857IJ/9/VyQM0lbacNQFqZE5AqRm1xy7YPBCs7FuThl59e7MWkAGWlxwpvv+APIq0xEwTyW47JfPJkCw5k=
X-Received: by 2002:a05:6214:12c:: with SMTP id w12mr5886341qvs.25.1622234826861;
 Fri, 28 May 2021 13:47:06 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAB=NE6UdvJ3QdimXxbWVJr0+vTU+rkqjChtN-bgDyQ8VY83-TA@mail.gmail.com>
 <20210528193834.mwf6qvuw6wng7yoz@nitro.local> <CAB=NE6We=Vr8hDOBVmfiZxZyDqJXXfA9yz5t13aqMwdrp7pBZA@mail.gmail.com>
 <20210528195320.c2vbhfg3zj365ebw@nitro.local> <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
In-Reply-To: <CAB=NE6WTiopsyy=yGrpaGECqP_m7ANhpCjDEtE+C1x-Jz1pqpA@mail.gmail.com>
From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 May 2021 13:46:55 -0700
X-Gmail-Original-Message-ID: <CAB=NE6X5uUWA7Sfu_qvz2smddgc4euBT-x7xGs8=7+K-W5v2RQ@mail.gmail.com>
Message-ID: <CAB=NE6X5uUWA7Sfu_qvz2smddgc4euBT-x7xGs8=7+K-W5v2RQ@mail.gmail.com>
Subject: Re: grokmirror and pi-piper for all emails on a list
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Figured folks might be interested... it took only about 5 minutes on
the first run, the second run, with my settings took about 8 minutes.
Not too shabby (nvme drives)!

  Luis
