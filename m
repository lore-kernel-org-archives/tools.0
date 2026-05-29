Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29C2EA481
	for <tools@linux.kernel.org>; Fri, 29 May 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060190; cv=pass; b=ImeBThRxfwwCoiXJegnIBwnB+9Z0KifQwnwcbLAJGvlFBBmSEV0RKEmwcF2jVHtN9bFXSQL2bd+d4i5d5/1f8vf6HNatWKK2Ex2bkMLa/KkOZsXI6cWGKXj4pgNXsxKFOMP50K6DSwIO1K3a9sEiBk9k6cSV/hTbvVTEAGXzAbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060190; c=relaxed/simple;
	bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nigMuMRma3ZTSca0/HuGIpSxm5F20w2WVJjrOWFp6QaFEpFQT/dmrPivzHvfMPyDKgPaaM+ZtfsDwSi+cvIAxC+grcGVFvMczwP5nrQFH3r3GVsZOcobyZ/LJ0G+ojZbG3VGLA5KqfNAvaL629M0AHERpi5UnpZ9IGljLfR4Edk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgXnYCsn; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgXnYCsn"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57516e08474so10086384e0c.3
        for <tools@linux.kernel.org>; Fri, 29 May 2026 06:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780060188; cv=none;
        d=google.com; s=arc-20240605;
        b=WUexc+qZNI/e6ykbO9NiOasBVXLJKbBqoLuP3tuiqce1gYNqd6qA+HkgGaYT9CiOMU
         iyNt5Myt2Ef3Oijbybv4RSzcE7zjwM+e7UMbyty4ABpYuvIh6CgGhrhmSt+egFd/+Bb8
         bLdcvyqqmvcP74JjaP1x7Iw6O4iy8JjaX1k3XLtFF9KtlPgcY3fp94Cc0VCEVx/NqqcT
         0KZLh8OivVV9C7MpQD3Xnrpc/bCdD61EGrr1AorYs2JnY5KK5EWcNdJ3hcQBJ5jeMyL4
         t4xK3GYLeeYnkzuXjuBnWnhUEVUGDfWqB1grNzAA4k9GgjjGDbzOo1HPJ/7EotQ4JnK7
         ynzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        fh=7cPBddYPjf7aYOAPEfc3AwtYQk7kCCFyDxvco1WGy8s=;
        b=d9lXXlub8E22WVWKCaOdO8ATofe+B+tl23EWUcA+OuS3YFkO5WWnEoBFv/2zOyE0Ks
         hpqfqLMDdRetcHt6ZdlyIBP6e+ESZU/yPXJl6AGH1aQGaz/1gZfEfSFWiKicWNLXy1ad
         YlIRlh6Y0CwaKwkPsPTIyyONncj8Sa/gUG3k3iJO9fjKm2IMYgw/GJ4gSyawJPtKrJKB
         U1Mym27uyTYdbUoCWaC+woRNzdnuHRf0uFiq7Lao4ZLiu/M/D3hXotlb53MJabOrs6KX
         LnmEaFAWpCNUvwBIEBDiSg0jQrkZqxU+Q+3Ql/UG1/hXSMgFUvLM3QJTIPmJfwWShVdH
         BcVQ==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060188; x=1780664988; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        b=NgXnYCsnzGzHv+jOnOxtxW6PLLTl32WY52rPQC2DGYGKNPG210UHn2kFcvgB6Mlae1
         Ty7FNTb2KeaJfYQHS9M76iE/s09N17gqAw0jD4WUMRDSriBHJaCqpU4SpqD4L1ovBtVV
         NWk3Ex7iDHejpg10OWBFpMyDFFvJswYfNWXA0BAKJriniAKfVTRgC370Wb4ZwOm+66gT
         PUcP57/TGAWibWchERyvzvqysEFoK7g+aKi6iwzM0cMpk2VnFHzxYAY9mMiJ9UDWtEyL
         bvVkftJSDJzkD2zF836p7hZxo8UB2A3gvqLWBvXi+s//si1ey/pX1VHK/F2byzTjTfVv
         rDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060188; x=1780664988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2HeTxNq3PoWtYDMWwaAfJj37+shOuEVRHtJWh++R7E=;
        b=f1r8JNcZOBMwePxJ3k6s9vf6gBOEoL8H/3NmsfWk2JlrBIr5QZvq/CXRxkW0H7cQWY
         bkMy8mrI/XNyhg6CLbHpd5VHDdWJ7mtRlDVrQSSU6uHA+q2w/Kg+sbQFupzpL+BJy35e
         89mdVhnIrcFAMvc0k0Eq/K2j+4aF1MYtAagWNaFCT5rMGzjemmRszTMGuGBqpkJnb8+f
         Ex4bJ0KrkHXS39DVIqOqrBls/OBeDXh6S9WIfPeyZdDmmQuS8bPfOUgpKZFScyAaXKFt
         zsEEvV7aM1Pon286fX2mD88i7KPER/3gs65Vh8XhFJWbAYqhhg2cPq+7Cp8KB8RVfnXu
         YQxA==
X-Gm-Message-State: AOJu0YxHIekJLkHaelQ4lgSP7iepEZyK3REnZbILRm4H41YCEB0tZGiY
	1PqME3qioQuPW5LAfeGTir9RiijPZIZBraInGbHhl6Geru5wRl+ErDc+wettw9OQlKC8SE9IgGt
	7eWsnutvKZaHc6BeX4y0q/TBpNX2VIYsw82cXit8=
X-Gm-Gg: Acq92OEGbsyx2s3sGLDlGcY9JBCidrZsYNMrtZQyOS0Gpg6yNKIj2PTi4S7IDrCaACV
	ikXMJBgUmbXjsdELsSqZQYFjisfB8PHa/qtW9ZVuoWZpy53NoX5g3IRmiVraDpsV9e60rAKEH6A
	YrLF9Q8NF4tJFtQFHrW0KGYzurqWgNHPXorhpaulpc8Cf6haBRC1OjlnzpNsgI3LkMLlQ3iCXc6
	pFnTkgNaMFKjXB5T7XOr/XmzVtSayeEWVTpZEqDuUg9ovDTOpcIhyg/ggthQjTuSSpMu9A+Af8k
	aMx+mxTMcLiF2rxKP+eWDbLop5b7kmwMB9L/l+9Rp3sr4qNF
X-Received: by 2002:a05:6122:4d10:b0:56b:7d4d:4d11 with SMTP id
 71dfb90a1353d-599f2c4c703mr1000119e0c.1.1780060188156; Fri, 29 May 2026
 06:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: mo to <pitar21@gmail.com>
Date: Fri, 29 May 2026 22:09:37 +0900
X-Gm-Features: AVHnY4JBM-Qu9vQAa9PhowlPhXN4BxV5J-9YRNJ2B4b1E2jg_GbxJjoXCPtSc4A
Message-ID: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
Subject: Proposal: preflight checklist/lint for AI-assisted Linux kernel bug reports
To: workflows@vger.kernel.org
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I understand that AI-assisted vulnerability and bug reports have
recently become a burden for kernel maintainers, especially when
reports are duplicated, unverified, or lack enough technical detail to
be actionable.

I would like to suggest a lightweight =E2=80=9Cpreflight=E2=80=9D process f=
or
AI-assisted bug reports.

The goal is not to replace the existing Linux kernel email workflow,
nor to move kernel development into a web-based ticket system.
Instead, the idea is to add a simple validation layer before a report
reaches maintainers.

For AI-assisted reports, the submitter could be required to include a
structured checklist such as:

AI-assisted bug report checklist:

- Kernel version:
- Commit hash:
- Architecture:
- Kernel config:
- Affected subsystem / file / function:
- Reproducer:
- Reproduction rate:
- Full dmesg / KASAN / UBSAN / lockdep / syzkaller log:
- Checked latest mainline: yes/no
- Checked stable trees: yes/no
- Checked lore.kernel.org for duplicates: yes/no
- Existing patch found: yes/no
- Why this is considered a security issue:
- Impact assessment:
- Suggested fix or mitigation:
- Human verification performed: yes/no

Reports that do not include basic information such as a tested commit,
reproducer, full logs, duplicate search summary, and existing-patch
check could be automatically rejected or redirected before maintainers
spend time on them.

This could be implemented in a few possible ways:

1. A simple web form that outputs a properly formatted plain-text report.
2. A local command-line tool, similar in spirit to checkpatch.pl.
3. A report.yaml / report.txt format with a validator.
4. A mail bot that replies automatically when mandatory fields are missing.

A local tool may fit the kernel workflow better than a centralized web
form, since it avoids dependence on Google Forms, GitHub Issues, or
any specific hosted service.

For example:

$ kernel-bug-report-lint report.txt logs/

[FAIL] No tested commit hash
[FAIL] No reproducer
[WARN] No lore.kernel.org duplicate search summary
[WARN] Impact says "privilege escalation" but no reachable path is describe=
d
[PASS] KASAN log included
[PASS] kernel config included

The key principle would be:

If AI was used to find the bug, AI or automation should also be used
by the reporter to perform initial triage before sending the report to
maintainers.

In other words, AI-assisted reports should include AI-assisted or
human-assisted triage results, not just an unverified =E2=80=9Cthis may be =
a
vulnerability=E2=80=9D claim.

This would reduce duplicate and low-quality reports while preserving
the existing mailing-list-based development process.

This proposal is intentionally small. It does not require maintainers
to pay for LLM APIs or run an AI system themselves. The cost of
AI-based analysis should remain on the reporter side. The kernel
project would only define the minimum structure and validation rules
for acceptable AI-assisted reports.

Thank you for considering the idea.

Best regards,
