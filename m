Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73905101D8
	for <tools@linux.kernel.org>; Fri, 23 Jun 2023 18:10:53 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-763e1a22a68so81594685a.0
        for <tools@linux.kernel.org>; Fri, 23 Jun 2023 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687543852; x=1690135852;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFoJNQDKp8UeqApEic2h6nfjPczpAqsiIwOcqpiq9U4=;
        b=adiihZW2DVQsgcFxdMraxJavqvmDHKywabQtZ1E8PobJflC8GDhDuLK87aiQw/f5GW
         3wYxT078bYxl3LpdQKKxu5q2fOtJCNWj4DQprZTz1TL8WcCyUVHSn1GrMN9VlFfZPzj3
         uL0I1ljEidkfINM57meCf+HbDTbFj4gQqup9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687543852; x=1690135852;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFoJNQDKp8UeqApEic2h6nfjPczpAqsiIwOcqpiq9U4=;
        b=H60wt5l4tUZy2PEYNdVNCs22bs6ss0LBpXW1Hee69yh06Q7iPgX/mS8FoRdgr/aLUo
         jQasvPQWI9GuVkuR4jjat+gEhdzy61IjLVyNMv8UxPDB6qbP4sCZPRM2rxximqVxQhMd
         OViTImebrJb8kOW/IxMSG6prq0+WHnpRu3F/oBLxzp3KZgVJEA/6lQbk9UNwZYPdZbIx
         pJnuqoP6YsPDd+BAcbpkybj+qy0hJ9RSFkBDocVywquxe3+V+SkKfk4/nQEWa2FXsqXI
         zJdf8muQAgooqs+YY1Jv11DDO4uWIMZCEDeFU/6tnuYP476rTvWwiUVxqd8qaCj46e7Y
         S1Hg==
X-Gm-Message-State: AC+VfDy5BgGjU0ArXWUxdNtA8ppyYfUDV2fo8uLh0YhQx/PIoby48noF
	5XwsxtIZwzYGUi6PJG2igxggPf7XwV+hYhJSToo=
X-Google-Smtp-Source: ACHHUZ62ZbATq3sFUd8eFAvkMNwI9ItQLqaQL8q4tEpayTHfRUvDJQ2KzJzS8EdS9rhLU9d2S8iYbg==
X-Received: by 2002:a05:620a:424d:b0:75b:23a1:3606 with SMTP id w13-20020a05620a424d00b0075b23a13606mr16397435qko.23.1687543851749;
        Fri, 23 Jun 2023 11:10:51 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id u4-20020ae9c004000000b007620864d547sm4721672qkk.120.2023.06.23.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 11:10:50 -0700 (PDT)
Date: Fri, 23 Jun 2023 14:10:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 0.12.3 available
Message-ID: <20230623-display-prevalent-44c89b@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5g3cxm6aankr3rcb"
Content-Disposition: inline


--5g3cxm6aankr3rcb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I am pleased to announce b4 version 0.12.3, which includes many bugfixes and
minor feature improvements. Everyone must upgrade.

To upgrade using pip:

    pip install --upgrade b4

If you're using a git checkout, you can just update to the latest
stable-0.12.y HEAD.

$ git shortlog v0.12.2..v0.12.3

    Dominique Martinet (1):
          b4.sh: keep existing PYTHONPATH if set

    Erik Schilling (1):
          docs: fix smtpServerPort option

    Ira Weiny (1):
          b4: Allow prep new branch while on a b4 managed branch

    Konstantin Ryabitsev (17):
          Up version to 0.12.3-dev
          ez-trailers: don't crash when there are no follow-ups received
          ez: do not trust local commands to properly reflect
          Add subscribe/unsubscribe to badtrailers
          ez: better fix for "no follow-up trailers" condition
          Consider '@' safe in msgid URLs
          Clean headers before adding them to the pre-scissors email
          Fix to properly handle under-scissors patches with a unixfrom line
          ez: only include base-branch when using non-default strategy
          ez: make message-ids use today's date
          ez: make it easier to send single-patch series
          Fix wrong CTR header after 8bit cover content is mixed in
          trailers: normalize address after parsing
          shazam: switch to top of git tree before running git-am
          Properly quote the address before adding into From
          ez: store sent prefixes with the tag message
          Up release to 0.12.3

    Matthieu Baerts (2):
          trailers: accept recognized link trailers
          trailers: add 'Closes' as recognized link trailer

    Maxime Ripard (1):
          b4: Fix envelopeSender handling

    Philippe Blain (2):
          mbox.py::make_am: simplify check for early return
          am, shazam: allow cherry-picking an out-of-series patch

    Rob Herring (1):
          ez: Fix 'trailers -F' used on a single commit

Special thanks to the following people who helped with this release (in
reverse-log order):

    Erik Schilling <erik.schilling@linaro.org>
    Josselin Poiret <dev@jpoiret.xyz>
    Andrew Cooper <andrew.cooper3@citrix.com>
    Mark Brown <broonie@kernel.org>
    Christian Brauner <brauner@kernel.org>
    Maxime Ripard <mripard@kernel.org>
    Philippe Blain <levraiphilippeblain@gmail.com>
    Rob Herring <robh@kernel.org>
    Dominique Martinet <asmadeus@codewreck.org>
    Ira Weiny <ira.weiny@intel.com>
    Nick Desaulniers <ndesaulniers@google.com>
    Matthieu Baerts <matthieu.baerts@tessares.net>

Best wishes,
-K

--5g3cxm6aankr3rcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCZJXgKAAKCRC2xBzjVmSZ
bKyTAP0UPqdcZWuIZN8QsdBVDc9BNxepJ24ZmV4X//bVXDdgigD/acyvSGJ94UYK
yjWziSAzX+ehew4TrlqjQABO/IGP8Qo=
=RW6V
-----END PGP SIGNATURE-----

--5g3cxm6aankr3rcb--
