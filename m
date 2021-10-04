Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9E3FDE
	for <tools@linux.kernel.org>; Mon,  4 Oct 2021 20:39:44 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id f15so17176164qtv.9
        for <tools@linux.kernel.org>; Mon, 04 Oct 2021 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=3B4yHAbU5+YJbpX3E4mzf6mUXbfys+vaEueOaP0fK44=;
        b=Jh+7LEEssk48kjLSdgsxv/V6WEhE0JNV9Z/yl9RZ4e3ExgHp/KC1OTEmbxfWDIPXML
         0Pv6XNuDOWwVk0lZ+b898e1djOlb80FZvLc2e4tkk/ZIz+zMR+HIzuzRgjl9yWWeESgs
         01QXoegnTbIWCiSdVTtIjzgm38R827gEii0Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=3B4yHAbU5+YJbpX3E4mzf6mUXbfys+vaEueOaP0fK44=;
        b=Fa27RItgBocdRVgt02GFwX41u2qT4rnYVQjxsoarKBnIhmDkQZoluDpvnyA22Vsqhn
         Q7P9zWlwd1gkQdpZ0UEp8LNrST5wnh8aMj+ilR89GQjgh9x86nCRAtPT9cNqZwRFOEFT
         MHtnK4F6JRnVsRYez+WzQ51s2amt0MT1gPpZD6DPtcErieHFrI9SXU+PhdfYYBoi8Y/M
         GXVIvya+XxLJuklCPaVcL7jNwnodbtfMP/6w96HliMplQVoWcX6sT5AGpU+/R0VxeNCp
         f1Z9Flxs+DDEQZSOPkss34nfw8dSRMwX+E9lw4fAqijrKSZm+2cGRaLOFFRw6+nm7q3w
         dPtg==
X-Gm-Message-State: AOAM530HaAPAuROTcb3WBR8Ghu+s7P7aPyhx8dgzQIx0GFhM6o8v8XNm
	7jHpQASx+TAgjRwm1HPoFb5PsM7+WJLKGg==
X-Google-Smtp-Source: ABdhPJwm1Rnfp7+wQ8mWJ3Wnwnq2ypECaKCw82vXHYKGTmqjzSeDZLdzxtO8Iwo3mBSxfRbzQkliTg==
X-Received: by 2002:ac8:5617:: with SMTP id 23mr15815115qtr.257.1633379983205;
        Mon, 04 Oct 2021 13:39:43 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id b20sm8895206qtt.2.2021.10.04.13.39.42
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:39:42 -0700 (PDT)
Date: Mon, 4 Oct 2021 16:39:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: patatt: v0.4.9 is out with small bugfixes
Message-ID: <20211004203941.nuseyqsucipixkjj@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I am happy to announce version 0.4.9 of patatt:

- Fixes invocation with Google's patched version of git that carries fancy
  git-hook functionality changes (not yet upstream)
- Fixes crash when .git/hooks directory is not present

Thanks to Nick Desaulniers for the reports.

-K
