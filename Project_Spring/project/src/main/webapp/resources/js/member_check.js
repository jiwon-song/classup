/**
 * 회원가입시 입력항목의 유효성 판단,
   비밀번호 변경시 비밀번호재확인 
 */

var member = 
{
	//키보드입력시 입력값 태그별 상태확인
	tag_status: function( tag ){
		var name = tag.attr('name');
		if( name=='pw_ck' ) return this.pw_ck_status( tag.val() );
		else if( name=='teacher_pw' ) return this.pw_status( tag.val() );
		else if( name=='teacher_id' ) return this.id_status( tag.val() );
		else if( name=='email' ) return this.email_status( tag.val() );
	},
	
	space: /\s/g,
	
	//입력 이메일 상태확인
	email_status: function(email){
		var reg = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if( email=='' )		return this.common.empty;
		else if( email.match(this.space) )	return this.common.space;
		else if( reg.test(email) ) 			return this.email.valid;
		else								return this.email.invalid;
	},
	
	email: {
		valid: { code:'valid', desc:'사용가능한 이메일형식입니다'},
		invalid: { code:'invalid', desc:'이메일형식이 맞지 않습니다'},
	},
	
	//아이디 중복확인 상태확인
	id_usable: function( usable ){
		if( usable )	return this.id.usable;
		else 			return this.id.unusable;
	},
	
	//입력 아이디 상태확인
	id_status: function(id){
		//영문 소문자, 숫자만 가능
		var reg = /[^a-z0-9]/g;
		if( id=='' ) 					return this.common.space;
		else if( id.match(this.space) )	return this.common.space;
		else if( reg.test(id) )			return this.id.invalid;
		else if( id.length<5 )			return this.common.min;
		else if( id.length>10 )			return this.common.max;
		else							return this.id.valid; 
	},
	
	id: {
		invalid: { code: 'invalid', desc:'아이디는 영문소문자, 숫자만 입력가능' },
		valid: { code:'valid', desc:'아이디를 중복확인하세요' },
		unusable: { code:'invalid', desc: '이미 사용중인 아이디입니다' },
		usable: { code:'valid', desc:'사용가능한 아이디입니다'}	
	},
	
	//입력한 비밀번호 상태확인
	pw_status: function(pw){
		//영문대/소문자, 숫자 모두 포함
		var reg = /[^A-Z0-9a-z]/g;
		var upper=/[A-Z]/g, lower=/[a-z]/g, no=/[0-9]/g;
		if( pw=='' ) 					return this.common.empty;
		else if( pw.match(this.space) ) return this.common.space;
		else if( reg.test(pw) )		return this.pw.invalid;
		else if( pw.length < 5 )	return this.common.min;
		else if( pw.length > 10 )	return this.common.max;
		else if( !upper.test(pw) || !lower.test(pw) 
					|| !no.test(pw) )  return this.pw.lack;
		else 						return this.pw.valid;
	},
	
	//공통사용 상태값	
	common: {
		empty: { code:'invalid', desc:'입력하세요' },
		space: { code:'invalid', desc:'공백없이 입력하세요' },
		min: { code:'invalid', desc:'5자이상 입력하세요' },
		max: { code:'invalid', desc:'10자이내 입력하세요' }
	},
	
	//입력한 비밀번호확인(재입력) 상태확인
	pw_ck_status: function(pw_ck){
		if( pw_ck==$('[name=teacher_pw]').val() ) 	return this.pw.equal;
		else								return this.pw.notEqual
	},	
	
	//비밀번호관련 상태값
	pw: {
		valid: { code:'valid', desc:'사용가능 비밀번호' },
		lack: { code:'invalid', desc:'영문/대소문자,숫자를 모두 포함해야 합니다' },
		invalid: { code:'invalid', desc:'영문/대소문자,숫자만 입력하세요' },
		equal: { code:'valid', desc:'비밀번호가 일치합니다' },
		notEqual: { code:'invalid', desc:'비밀번호가 일치하지 않습니다. 다시 입력하세요' }
	}
} 