Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E92A2D
	for <tools@linux.kernel.org>; Sun, 12 Feb 2023 12:41:52 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id h19so10404494vsv.13
        for <tools@linux.kernel.org>; Sun, 12 Feb 2023 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzxIUYYEYLmL092chqRj0P4Wp7Zg6oVEjrTQ2uIZlFk=;
        b=DHkkbvSKCM947cWOlM67GzeoWlB9+FthyVB7Ho6vj7TyJ/5qyCxFTnJjs13kCHcx1z
         zNLRtNgMMY+tE0Pftto+tZZz0yJXQqieEkZCjMxJL2Uw/ul15oLkhyfTdS0MYgr2C8wY
         9QM3TqUA+o8O3jTzDDGCpnEUFGNQjm6i2u/mNAHqC1V5SplthLHmOTYfKBI4w6H9VWFF
         IWBNEEykgIPw9cAeKWJ8ImhhWbANp0Hwt28SpxBN4RJ6kOsIBIRzuoVkToElH3jwqM8P
         k7BR25Fgh1jDQKX208aKF8GsSX0Of6si1jal/iD+8sgV2HQCTpg2rp5tA6tOYAAo5oCh
         Vj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzxIUYYEYLmL092chqRj0P4Wp7Zg6oVEjrTQ2uIZlFk=;
        b=pN9V4K0n7EKsPAYQObHGuRBbbSfNC189K4qil6SJEUZlk1lgPWGCb9YwaunBNv7TQa
         7+RDXsDUtpM+rpDAlTNnlV0tZBIKAs7Al5LGxVTjEGhJSx6cCfA6C4egItEUsMM82JLB
         ZnWDYwqw/dBBn/aBew+MrcnUDuiKjC4gsQMcZP/NwKTnsGIQZMt3wTokqNN43aiH4Ip4
         PtKuaXsW6s0LbCpFhOYjRuOIeuLP9ObDyxM7Z1PG1y2qCd9StD3F7cK3oJA/IuodbC3z
         EZiXrwKXkt6tYqe1d3KsjdMTvVEifhkzIpoXMzbvxXKxoFfJ/NNVXYqjmWbpZGf/oyHR
         pEew==
X-Gm-Message-State: AO0yUKWMGnqBCDHNAZKn9LNI7OxqP+PAV8gjk4f7nXteTpizZ9RB+mbL
	TAZpf2qRldd6Di4FsnXrvgQUTh9/7SJrGGTI7ESdKHBo
X-Google-Smtp-Source: AK7set/w58YHDZbQKN2rS0T3eg2xXRAb1W0mPsrF5gE6pE1wM4fF5u2PeMq22zzxAnz/vi4WqucjQSfKG7joK3RRh98=
X-Received: by 2002:a05:6102:340b:b0:3f7:f257:3022 with SMTP id
 p11-20020a056102340b00b003f7f2573022mr4229949vsi.55.1676205711114; Sun, 12
 Feb 2023 04:41:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= <hector.oron@gmail.com>
Date: Sun, 12 Feb 2023 13:41:40 +0100
Message-ID: <CAODfWeFXwz4Ci5A=VaUvmyZL2daYe48+OOrjvq6wC-KTJS4hRA@mail.gmail.com>
Subject: b4: allow test run when source is not in git
To: tools@linux.kernel.org
Cc: "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>
Content-Type: multipart/mixed; boundary="000000000000fb914505f4800d2c"

--000000000000fb914505f4800d2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Konstantin,

  I am maintaining the b4 Debian package and we got a build failure
when running the tests due to the use of git rev-parse.
  https://bugs.debian.org/1031130

  I have included the following local patch to remediate the immediate
issue, which I would like you to consider adding to the b4 source
tree.

With kind regards find patch attached,
--=20
 H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . =
.-.

--000000000000fb914505f4800d2c
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-allow-test-run-when-source-is-not-in-git.patch"
Content-Disposition: attachment; 
	filename="0001-allow-test-run-when-source-is-not-in-git.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_le1dl67f0>
X-Attachment-Id: f_le1dl67f0

RnJvbSBjMWYwMzlhNzUzNzhiODA0ZjliOGIxNGMwYWY5NDc0ODdiNGY5NTRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/SD1DMz1BOWN0b3I9MjBPcj1DMz1CM249MjBN
YXJ0PUMzPUFEbmV6Pz0gPHp1bWJpQGRlYmlhbi5vcmc+CkRhdGU6IFN1biwgMTIgRmViIDIwMjMg
MTM6Mzc6NTYgKzAxMDAKU3ViamVjdDogW1BBVENIXSBhbGxvdyB0ZXN0IHJ1biB3aGVuIHNvdXJj
ZSBpcyBub3QgaW4gZ2l0Ck1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpTaWduZWQt
b2ZmLWJ5OiBIw6ljdG9yIE9yw7NuIE1hcnTDrW5leiA8enVtYmlAZGViaWFuLm9yZz4KLS0tCiBi
NC9fX2luaXRfXy5weSB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2I0L19faW5pdF9fLnB5IGIvYjQv
X19pbml0X18ucHkKaW5kZXggNGQ1YTZjOS4uOWQyMDNjYyAxMDA2NDQKLS0tIGEvYjQvX19pbml0
X18ucHkKKysrIGIvYjQvX19pbml0X18ucHkKQEAgLTI5NTUsMTAgKzI5NTUsMTMgQEAgZGVmIGdp
dF9icmFuY2hfY29udGFpbnMoZ2l0ZGlyLCBjb21taXRfaWQpOgogZGVmIGdpdF9nZXRfdG9wbGV2
ZWwocGF0aDogT3B0aW9uYWxbc3RyXSA9IE5vbmUpIC0+IE9wdGlvbmFsW3N0cl06CiAgICAgdG9w
ZGlyID0gTm9uZQogICAgICMgQXJlIHdlIGluIGEgZ2l0IHRyZWUgYW5kIGlmIHNvLCB3aGF0IGlz
IG91ciB0b3BsZXZlbD8KLSAgICBnaXRhcmdzID0gWydyZXYtcGFyc2UnLCAnLS1zaG93LXRvcGxl
dmVsJ10KLSAgICBsaW5lcyA9IGdpdF9nZXRfY29tbWFuZF9saW5lcyhwYXRoLCBnaXRhcmdzKQot
ICAgIGlmIGxlbihsaW5lcykgPT0gMToKLSAgICAgICAgdG9wZGlyID0gbGluZXNbMF0KKyAgICBp
ZiBnaXRfZ2V0X2NvbW1hbmRfbGluZXMocGF0aCwgWydyZXYtcGFyc2UnLCAnLS1pcy1pbnNpZGUt
d29yay10cmVlJ10pOgorICAgICAgICBnaXRhcmdzID0gWydyZXYtcGFyc2UnLCAnLS1zaG93LXRv
cGxldmVsJ10KKyAgICAgICAgbGluZXMgPSBnaXRfZ2V0X2NvbW1hbmRfbGluZXMocGF0aCwgZ2l0
YXJncykKKyAgICAgICAgaWYgbGVuKGxpbmVzKSA9PSAxOgorICAgICAgICAgICAgdG9wZGlyID0g
bGluZXNbMF0KKyAgICBlbHNlOgorICAgICAgICB0b3BkaXIgPSBvcy5nZXRjd2QoKQogICAgIHJl
dHVybiB0b3BkaXIKIAogCi0tIAoyLjM5LjEKCg==
--000000000000fb914505f4800d2c--
