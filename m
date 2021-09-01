Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB43FCD
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 14:16:40 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id t4so3119296qkb.9
        for <tools@linux.kernel.org>; Wed, 01 Sep 2021 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=xoyK0TDLuB1kKlTy9h4k9eAZBWntSIawXpXbMOTCAC0=;
        b=O+f8F6RNxnt40c7xR6V2WczC0wwQZd4HQ7V5QbNpNAM1SoLK0SNe0A78eBl+6nTaj9
         Ffg5QYUiTgrLpjj/YdTHXLjg2GaHu94uuBgeSvO/3mTvTYndRdol54TyXCFMkx6hcXT6
         81745GQp9XHxumzQU4OkTUHGaNDcRGg9zf9m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=xoyK0TDLuB1kKlTy9h4k9eAZBWntSIawXpXbMOTCAC0=;
        b=Zxh45OkRKwCiNv3IglK+4YQ7P6t433fyy5Qk0be2cDiJm3qZDAzaSVt1F0Z8dlYv0w
         ImMIhi+OIgSRi2ipEUHMKGWbSKcxfGtY0hbC1y2EyDN0GSKHX6vAoLjFL77mzqEsa84L
         p7rVzh3NKVaCentqE3WOJcBE6/txjEI9sjmA9ejkFR/tWl/v6e0UxhgInl7SXwgKL7/G
         FeSrRtFMOv27WA0ALxO2x7pzZiWMJG8fSF+STIJIksPo9nYMSDTcRF+OUzHsSV5GPEZd
         5RjNhOpMe1HqYhH5CnnXCKsLK6UW91zTuKRriKq96I/xqVkB99t6slXRTbIlEAdSlaSD
         fh9g==
X-Gm-Message-State: AOAM5337JecFAUpv/2Y1fj6qkzVW5a7/evgnrQUja6PXLDj2g2Q+XM3F
	xsiOBU/wLT7xU/ghADwaIGsMfQ==
X-Google-Smtp-Source: ABdhPJx+yrXQKZI4C0KyfQ9NSV6I3bmzjXzqI8RH2MS3odMwrE0KZGOuaFH29YMOIM9PTuvM4SG+hg==
X-Received: by 2002:a05:620a:2232:: with SMTP id n18mr8356384qkh.216.1630505799420;
        Wed, 01 Sep 2021 07:16:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id m5sm84155qkn.33.2021.09.01.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 07:16:38 -0700 (PDT)
Date: Wed, 1 Sep 2021 10:16:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 v0.8.0 is available
Message-ID: <20210901141637.fmvgs4hnk6m4ym7x@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

A new version of b4 is available that adds functionality to better work with
newer public-inbox features available on lore.kernel.org. There aren't many
new features compared to version 0.7.y, but everyone is encouraged to upgrade.

If you installed from pypi, just do:

    pip install --upgrade b4

If you're using b4 straight from a checkout, you can switch to branch-0.8.y
and run "git submodule update" to pull in the latest patatt updates.

Other than lore.kernel.org compatibility changes, the only significant
difference with version 0.7.3 is the --guess-base code, which should be a lot
more useful with this release. E.g. this message back from June is
successfully resolved to match the commit without any conflicts (gc485f7e98):

https://lore.kernel.org/lkml/20210617101910.13228-1-song.bao.hua@hisilicon.com/T/#t

	Link: https://lore.kernel.org/r/20210617101910.13228-1-song.bao.hua@hisilicon.com
		   attempting to guess base-commit...
	 Base: tags/v5.13-rc1-284-gc485f7e9863c (exact match)
 
(The usual caveat here is that this kind of guessing is not a guarantee that
the patch actually belongs at this commit -- merely that it applies without
conflicts there. For example, a patch may depend on newer/older code changes
in the files not touched by this particular patch/series. This is why it is
really important to provide base-commit: information in your patches, if
possible.)

Please report any bugs and regressions, as usual.

Best regards,
Konstantin
