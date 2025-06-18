Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593B1A705C
	for <tools@linux.kernel.org>; Wed, 18 Jun 2025 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258944; cv=none; b=eWdWGFH8DGS/Szb0gUArBzNQAFDMgIyYTSH/kZf2OP9W2JeLlmmdakUIpJAEyRtsqfnF1KcxrlTEUkDuWgcwOh6tuyE3dbZ0P6U7xzRg/DcqmnIHprLuGsQgqifPSnPDTKG9krSBzYKaB+TgmcvFSlwxKKzGCpJ02u26OhTleQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258944; c=relaxed/simple;
	bh=SpmFdhW6/F/QF6tVFt+AHhVDhwgRn8K2gpFVEgmDrv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pblfw4eXhfSeaUKl4QIzvXSJBZlgoQC3am24vq0t/Z+Fd13BQzWF0micX7hq9AIXYw8KzkAQ9T4mtaiqPSVIYOWvFdEa4xM7Eu832YmoaEuD2HKOOCHuW/gMeYB/PvwemJTmZHEkB5nts2Rn7FAgj8peZ57+Jks67EKclc72ueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ptr5V2kN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ptr5V2kN"
Received: by smtp.kernel.org (Postfix)
	id D3BC8C4CEF0; Wed, 18 Jun 2025 15:02:23 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF8C5C4CEE7
	for <tools@kernel.org>; Wed, 18 Jun 2025 15:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF8C5C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IEAP7L001940;
	Wed, 18 Jun 2025 15:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZZVsvbUnPzgoN1r7PoyW/ZoWu7N8J1
	kFnGyHYbCDoqs=; b=ptr5V2kNyYXd1KkKCcuSaT1HYkvJQmFHzjf3b3umgKkgkV
	BQ/y+XUL5bnW2VPFfc+MF0Wh5h4IE7nyfZ3ftRo9bdfFHMImTR3+7jsmiC64Q3uh
	hnbXirxttbDSN9MMS/sV2ww9/PUCdMTaVNYUmATzKdNgjsrC3ROIEppEvABFDDHX
	Nj7To5ia5w8IjtT5uIVikcBXG/Kr+nItv7RVgh7Vja36GkHM5U89coc1qE6h+GKu
	SR2FR+zxILFXul680NvHbJZJ3XkKm2Y22oVQdq/qFdiAeZD9P6XV+X3DDcVXAOV4
	ZfebaIVUXd2z0IvkyLbCig+n3eJw/Aj311HMRVmA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47beesw738-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:02:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55IC0NvF005544;
	Wed, 18 Jun 2025 15:02:14 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 479mwm9cjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 15:02:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55IF29Rf30605830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 15:02:09 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35D9958060;
	Wed, 18 Jun 2025 15:02:14 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2FDB58050;
	Wed, 18 Jun 2025 15:02:13 +0000 (GMT)
Received: from d.ibm.com (unknown [9.41.102.181])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 18 Jun 2025 15:02:13 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Create temporary directory in current working directory
In-Reply-To: <20250618-bipedal-saluki-of-expression-04cde5@lemur> (Konstantin
	Ryabitsev's message of "Wed, 18 Jun 2025 09:54:00 -0400")
References: <20250613-fix-magit-edit-v1-1-7c85ecc6333a@linux.ibm.com>
	<20250618-bipedal-saluki-of-expression-04cde5@lemur>
Date: Wed, 18 Jun 2025 10:02:13 -0500
Message-ID: <87wm99hz4a.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i7cm3aRew3V3FTBpWCa0KbO-Bp7CHE44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyNCBTYWx0ZWRfXymCteyR+pWMQ v5pCsooGvxiJSQxVkdMRUJVGCacOHJ4WEk2sqdNRayuCHEs7qacVTAn4bttJBKkJng4dE+b/KJj zQDDoQLthZCslVaJS9qlb47ZdibbFwsPVnjcqvqdOV+3Zz/od3UWv17j1NRDkgL4OWjPmUY2UTk
 7jr0jD4BqhkDEKezJOspjJM/76txE3BKHUiBP4zvE7s3bhG2HfoSUkruX1Lch/mhv4R7xumyZCq pZzM/mktcWskQiPJriR/lmnV9rV5NU8E+xyBXvtv/5h6I4cr6JFxXjCdUP0Hc7ukTKmt72NFNlE JvfPzBkZ1LI82oByAK51hSOUXI0NTyewKWWZQAvyvG8w/NxfRmvpQ/dJzgGc593f0FuVcIHv8f/
 Ugdr/a+BLlCfF5gJw6T+cDEaU0hHG7La1NF73Q3Ss+HwLqyzBsGR390iBiegnldtPlEGuDHU
X-Authority-Analysis: v=2.4 cv=PrSTbxM3 c=1 sm=1 tr=0 ts=6852d4f8 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=ag1SF4gXAAAA:8 a=_nfwnCaU8BGYFbgPya0A:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: i7cm3aRew3V3FTBpWCa0KbO-Bp7CHE44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180124

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Jun 13, 2025 at 02:04:05PM -0500, Dave Marquardt wrote:
>> 
>> 
>> ---
>> In edit_with_editor, create temporary directory in current working
>> directory. This avoids issues with Emacs and Magit, which insists
>> COMMIT_EDITMSG must be in the repo's directory tree.
>
> I'm curious how you ended up with the --- at the start of this. Seems like a
> bug that needs fixing.

Hmm, I'll take a look at that too!

>> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
>> index 0a7daec..79d695a 100644
>> --- a/src/b4/__init__.py
>> +++ b/src/b4/__init__.py
>> @@ -4423,7 +4423,7 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
>>      editor = corecfg.get('editor')
>>      logger.debug('editor=%s', editor)
>>      # Use filehint name in hopes that editors autoload necessary highlight rules
>> -    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
>> +    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=Path.cwd()) as temp_dir:
>>          temp_fpath = os.path.join(temp_dir, filehint)
>>          with open(temp_fpath, 'xb') as edit_file:
>>              edit_file.write(bdata)
>
> I think we can do better than that. We can call call git_get_toplevel() and,
> if that is not None, specify dir as toplevel/.git/b4, otherwise default to dir
> as being None to let it use whatever Python thinks should be the default. Can
> you test if using .git/b4/COMMIT_EDITMSG will do the right thing for you?

Yes, that's a good idea. I'll work on an update.

> We shouldn't use cwd(), because this can litter your git tree with junk. I
> know Python is supposed to always clean it up, but this can still have bad
> consequences if you run the editor in b4, forget that it's open in another
> terminal window, and then try to do some git operations.

Yeah, I can see that happening!

-Dave
