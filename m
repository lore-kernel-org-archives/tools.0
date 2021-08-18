Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB09168
	for <tools@linux.kernel.org>; Wed, 18 Aug 2021 19:07:53 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id j9so2251194qvt.4
        for <tools@linux.kernel.org>; Wed, 18 Aug 2021 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Kuk6Gbb1B/glIil/MhDM/OBpE+UMUKteSlemS5BrOYE=;
        b=Z9zsDcLHrfNPtUVNGvdVuuWfX8U1uqmSCLIJLg8Xu4+ElqG1CJ7pLnEUZoD2ZCR5aS
         YdTUMx03evJf2OWvL7hyBm9NBWddAINCnBFtvBW6B3O3Edgm5apgcCr/cZLZzrkkOn/X
         JNY/ZFkY4MkpgsmstJXtWG/Oq4z4Tmmpnlupw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Kuk6Gbb1B/glIil/MhDM/OBpE+UMUKteSlemS5BrOYE=;
        b=gOoO1r8YBEk9k+g7+HEvX8Hr97drT7IAScNzlViMUregt9RuJzFRYsccBxjjDl9+kv
         0Z1S7X+TQSY/E5hyFQcHRhdixf5eKXgnLN/BNPBzvy2IK7xwKMGXwjACBpzhOln4gFRK
         QXiEMrPC+QUYotPbhobQjGVyqUvrsFMyZ5QrEddrMlZqrxL0PDuttiOlN2VBS+FpWeKv
         I9CavKhi8eP1urSqQRIe/rOtaO2R643d2nJ32Q1ALgC3BMpKaB4nBWz9pyNFJGkIDZ7s
         W1VqV+ZM8eMaKmcwLdSvs4oq7UD8vxU/Sa1f8xDi46TN6ju89DEy+6gPehmC54drYYZq
         pWVg==
X-Gm-Message-State: AOAM530UI+Y7QgM8zr7jvhXmMhgogWOC3GqSOQ02oUoRzyejjZdx35Xc
	zaHMAs6r+7wxgUOf0M4Vxg6Udw==
X-Google-Smtp-Source: ABdhPJySK407I1Lce8AMEgQOm6IduMi+xaOeDKHpKFjXD1JhvPn1Qh8AXlyAgBCzb6G4Ul86n8sCWw==
X-Received: by 2002:ad4:5bc8:: with SMTP id t8mr10139061qvt.18.1629313672967;
        Wed, 18 Aug 2021 12:07:52 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id i19sm361459qka.53.2021.08.18.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 12:07:51 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:07:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: New version of lore available for preview
Message-ID: <20210818190750.g3xedu7j24sqndo2@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gficfe2dugqmdje6"
Content-Disposition: inline


--gficfe2dugqmdje6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

We will be deploying a newer version of lore.kernel.org soon, with the
following significant improvements:

1. The default view becomes /all/, which displays messages from all lists and
   allows the usual query/retrieval operations across all sources. This
   achieves multiple goals, such as ability to aggregate threads regardless on
   which list the follow-up discussion took place and will automatically
   backfill missing messages if they are present on one list but not on
   another.
2. Instead of a single system, lore.kernel.org will be mirrored across three
   nodes currently serving git.kernel.org. This both reduces single points of
   failure and makes things faster for folks in EU/APAC.
3. The web interface will now respect your browser-preferred color scheme and
   will display dark mode interface if that's how you like it.

You can access the new version at https://x-lore.kernel.org/ and it should be
fully usable for daily operations.

You can use x-lore with b4, though I strongly recommend switching to master
branch in order to better deal with some of the changes happening on the
server-side. Simply add the following to your ~/.gitconfig:

[b4]
  midmask = https://x-lore.kernel.org/r/%s

Please report any problems or hiccups that you discover. There is no specific
ETA for the new version go-live, but if all goes well, the hope is to have it
in place by end of August.

Best regards,
-Konstantin

--gficfe2dugqmdje6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYR1ahgAKCRC2xBzjVmSZ
bNigAQCgk3j1hG8lO1iOtD802LXZZsRZzEefm1bCvgm2Mo+8+wEAmbf0uS30L+91
AXWQeWedn4WZ5YX6IWHcDxGAFEYEmwY=
=NYg4
-----END PGP SIGNATURE-----

--gficfe2dugqmdje6--
