Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C992C80
	for <tools@linux.kernel.org>; Wed, 20 Oct 2021 15:10:46 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id d20so2240145qvm.8
        for <tools@linux.kernel.org>; Wed, 20 Oct 2021 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=rRoh4NojG8Wjokvlh5/UQPNVhqnZkIpr6y/0VQAD6Ow=;
        b=GllZsR0MHur75MeGFeyX/nFMsiuf/2aYrrw3mI5ydE1S7HB2W/FrCKmo1XWoY0MzqA
         yLG8x5OPmg97j+YtF3dPUj28JtFVw8hKukge4lkXyGdsDfvWbOpwKASYE8nQ7iY8lLyJ
         FWBaN4TvZyWTyEM8KaGet80Ch8j5AVTvoGei0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=rRoh4NojG8Wjokvlh5/UQPNVhqnZkIpr6y/0VQAD6Ow=;
        b=f0OomDx7+DocjClOV0qnjjOFzWN3h9PSBsCNtu7Up5scLUs7LJLHC3xDJr1m15PO2e
         Iv0OzRu1xaO7SU+bWreru1n7BwS77GZqwQ4l2flDQcQFtYaef9UwCcpqEtpM/UimTJhR
         3VSkGqy4mMxlw7321q1clQ/8Ikf2T/eEqb30qPq0sd5GO+FHdsxYZELvWO0LgxRwjAs9
         KrdDKXecD9mUEb15j/pjuinO917SiiFsbIwOEVVx20eYfadTDqhMnXxr0OAgiK7RkzXl
         ENr2A2c6gP2UTm2Z03RKGH17Tro8g7LmpiQ8/ZKkffk+uGrUMsMb0Ta7k0b/FAwWoK0q
         C2sQ==
X-Gm-Message-State: AOAM530v0/rW4htSyoLCpfBr/KHfEIV7MviIJQ+hAQqOzh8A2aAzIrcz
	kMmi936H72Rs5W/OO09h9UUPTQ0AIEk=
X-Google-Smtp-Source: ABdhPJydu2BYmLfYhYVDTkw+1xEINFn+DPgc/lN2pqRqqp1X+LVlkAk5/X6RGazEcTJtm2t/bv0eOg==
X-Received: by 2002:a0c:e492:: with SMTP id n18mr92976qvl.17.1634742644979;
        Wed, 20 Oct 2021 08:10:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g4sm1071213qtp.43.2021.10.20.08.10.44
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 08:10:44 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:10:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4: shazam and ty flag changes
Message-ID: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fery6gqgtnkthcqw"
Content-Disposition: inline


--fery6gqgtnkthcqw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Based on feedback, the latest master branch implements the following important
changes to the ty and shazam subcommands:

b4 ty:

  - there's initial implementation to send out thanks-mail directly instead of
    simply writing out .thanks files. It will look at any existing [sendemail]
    git configuration already used by git-send-email, but only currently
    supports the more popular subset of possible configuration parameters,
    specifically:

        sendemail.smtpServer
        sendemail.smtpServerPort
        sendemail.smtpEncryption
        sendemail.smtpUser
        sendemail.smtpPass
        sendemail.from

    This is only lightly tested with the two mail servers to which I have
    access, but should work for kernel.org and linux.dev accounts.

  - if you have multiple sendemail identities and you want b4 to use a
    specific one, you can set the b4.sendemail-identity configuration
    parameter to tell b4 which identity to use.

  - there's an important flag change: the -s,--send option used in versions
    0.8 and prior to select a subset of tracked patches/pull requests is now
    called -t,--thank-for in order to reduce possible confusion with the new
    -S,--send-email flag used to invoke automatic mail sending. Since "ty" is
    still marked as "EXPERIMENTAL", I don't feel too bad about this change.
    Attempting to use -s will just give "no such option" error, so there
    shouldn't be any unintended side-effects other than potential annoyance.
    Sorry about that in any case.

  - there's also a --dry-run flag now to preview emails before sending them
    out. This will not mark tracked patches/pull requests as sent.

b4 shazam:

  - Based on feedback, I changed the default behaviour to apply patches to the
    currently active tree instead of simulating a pull request and fetching
    into FETCH_HEAD. So, running "b4 shazam <msgid>" will now run "git am".

  - You can still simulate a pull request and fetch a patch/series into
    FETCH_HEAD -- use the -H,--make-fetch-head flag for that purpose, e.g.:
    b4 shazam -H <msgid>

Best regards,
-K

--fery6gqgtnkthcqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYXAxcwAKCRC2xBzjVmSZ
bLE8APwMjXxogBpLSSIVm+GbbyKLLMrD96SLBtBECiJzu2mynwEAyl/lXfaCYw9l
oWMD6fBx4I7kuIhpFveaXr9ADCIYIgc=
=q9S5
-----END PGP SIGNATURE-----

--fery6gqgtnkthcqw--
